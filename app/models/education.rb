class Education < ApplicationRecord
  DESCRIPTION_MAX_LENGTH = 255
  belongs_to :cv
  validates :school, presence: true
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }

  scope :chronological_order, -> { order(created_at: :desc) }
end
