class Experience < ApplicationRecord
  belongs_to :cv

  validates :company, :title, presence: true
  validates :website_url, format: { with: %r{\A(http|https)://[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(/.*)?\z}ix,
    message: 'is invalid'}, allow_blank: true

  scope :chronological_order, -> { order(created_at: :desc) }
end
