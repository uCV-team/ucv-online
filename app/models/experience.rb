class Experience < ApplicationRecord
  DESCRIPTION_MAX_LENGTH = 255

  belongs_to :cv
  validates :company, :title, presence: true
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }
  validates :website_url, format: { with: %r{\A(http|https)://[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(/.*)?\z}ix,
                                    message: 'is invalid' }, allow_blank: true

  scope :chronological_order, -> { order(created_at: :desc) }
end
