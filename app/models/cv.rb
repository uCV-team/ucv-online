class Cv < ApplicationRecord
  include PgSearch::Model

  ABOUT_MAX_LENGTH = 1000
  INFO_MAX_LENGTH = 255
  CV_SECTIONS = %w[intro summary skills extras headshot].freeze

  belongs_to :user
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :locations, through: :user
  has_one  :current_location, through: :user
  has_many :flags, dependent: :destroy
  has_one :most_recent_experience, lambda {
    merge(Experience.most_recent_by_position)
  }, class_name: 'Experience', inverse_of: :cv

  validates :about, :authorization_statement, length: { maximum: ABOUT_MAX_LENGTH }
  validates :future_plans, :authorization_statement, length: { maximum: INFO_MAX_LENGTH }
  validates :interests, :authorization_statement, length: { maximum: INFO_MAX_LENGTH }
  validates :user, uniqueness: true
  validates :expected_salary_cents, length: { maximum: 9 }, presence: true
  delegate :email, :tel, :subdomain, to: :user

  accepts_nested_attributes_for :user

  has_attached_file :headshot,
                    styles: { default: '185x185#', large: '370x370#', quality: '100' },
                    default_url: '/images/:style/missing_headshot.png'
  validates_attachment :headshot, size: { in: 40..4000.kilobytes },
                                  content_type: { content_type: ['image/jpeg', 'image/png'] }
  attr_accessor :remove_headshot

  scope :published, -> { where(published: true) }
  scope :headshot_present, -> { where.not(headshot_file_name: nil) }
  scope :about_present, -> { where('CHAR_LENGTH(about) > 70') }

  before_save :delete_headshot, if: -> { remove_headshot == '1' }
  before_create :set_authorization_statement
  after_save :update_published_at, if: :saved_change_to_published?

  scope :featured_last_four, lambda {
    from(
      <<~SQL
        (
          SELECT cvs.*,
                 latest_experience.title  AS job_title,
                 users.subdomain          AS user_subdomain,
                 users.first_name         AS first_name,
                 users.last_name          AS last_name
          FROM   cvs
                 INNER JOIN (SELECT experiences.*
                             FROM   experiences
                                    JOIN (SELECT cv_id,
                                                 MIN(position) AS position
                                          FROM   experiences
                                          GROUP  BY cv_id) latest
                                      ON experiences.position = latest.position
                                         AND experiences.cv_id = latest.cv_id) AS
                                       latest_experience
                         ON latest_experience.cv_id = cvs.id
                 LEFT JOIN users
                         ON users.id = cvs.user_id
          WHERE  published = true AND
                 headshot_file_name IS NOT NULL AND
                 CHAR_LENGTH(about) > 70
          GROUP BY cvs.id, users.subdomain, latest_experience.title, users.first_name, users.last_name
          ORDER BY cvs.updated_at DESC
          LIMIT 4
        ) cvs
      SQL
    )
  }

  # TODO: Replace hard coded dictionary with locale
  pg_search_scope :full_text_search,
                  against: {
                    about: :B,
                    skills: :B,
                    working_skills: :A
                  },
                  associated_against: {
                    educations: [
                      %i[degree A],
                      %i[description C],
                      %i[school B]
                    ],
                    experiences: [
                      %i[company B],
                      %i[description C],
                      %i[title A]
                    ],
                    languages: [
                      %i[language A],
                      %i[level B]
                    ],
                    current_location: [
                      %i[city A],
                      %i[country B],
                      %i[geocoded_address A],
                      %i[original_address B]
                    ],
                    user: [
                      %i[first_name A],
                      %i[last_name A]
                    ]
                  },
                  using: { tsearch: { prefix: true, dictionary: 'english' } }

  def abbr_name
    "#{user.first_name} #{user.last_name[0]}."
  end

  def full_name
    "#{user.first_name} #{user.last_name}"
  end

  def gender_female?
    gender == 'f'
  end

  def flagged_by?(user_id)
    flags.where(user_id: user_id).any?
  end

  def salary_expectation
    expected_salary_cents.present? && expected_salary_cents != 0
  end

  def notice_period_days
    !notice_period.zero?
  end

  private

  def set_authorization_statement
    self.authorization_statement = I18n.t('content.main.cv.show.authorization.content')
  end

  def delete_headshot
    self.headshot = nil
  end

  def update_published_at
    published? ? update_column(:published_at, Time.zone.now) : update_column(:published_at, nil)
  end
end
