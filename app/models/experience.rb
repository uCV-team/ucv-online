class Experience < ApplicationRecord
  before_validation :check_website_url, if: :website_url?
  DESCRIPTION_MAX_LENGTH = 1000

  belongs_to :cv
  validates :company, :title, presence: true
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }
  validates :website_url, format: { with: %r{[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]
                                          {2,63}(:[0-9]{1,5})?(/.*)?\z}ix,
                                    message: 'is invalid' }, allow_blank: true

  scope :chronological_order, -> { order('ended_on IS NULL DESC, ended_on DESC, started_on DESC') }
  scope :by_position, -> { order('position') }

  scope :most_recent_by_position, lambda {
    from(
      <<~SQL
        (
          SELECT experiences.*
          FROM experiences JOIN (
             SELECT cv_id, min(position) AS position
             FROM experiences
             GROUP BY cv_id
          ) latest
          ON experiences.position = latest.position
          AND experiences.cv_id = latest.cv_id
        ) experiences
      SQL
    )
  }

  private

  def check_website_url
    self.website_url = website_url.squish.strip.downcase
    self.website_url = "http://#{website_url}" unless website_url.start_with?('http')
  end
end
