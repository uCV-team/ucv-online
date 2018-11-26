class Cv < ApplicationRecord
  include PgSearch

  ABOUT_MAX_LENGTH = 120
  CV_SECTIONS = %w[intro skills extras].freeze

  belongs_to :user
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :languages, dependent: :destroy

  validates :about, length: { maximum: ABOUT_MAX_LENGTH }
  validates :user, uniqueness: true

  accepts_nested_attributes_for :user

  # TODO: Replace hard coded dictionary with locale
  pg_search_scope :full_text_search,
                  against: {
                    about: :B,
                    skills: :B,
                    working_skills: :A
                  },
                  associated_against: {
                    education: [
                      %i[degree A],
                      %i[description C],
                      %i[school B]
                    ],
                    experience: [
                      %i[company B],
                      %i[description C],
                      %i[title A]
                    ],
                    language: [
                      %i[language A],
                      %i[level B]
                    ],
                    location: [
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
end
