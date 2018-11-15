class Education < ApplicationRecord
  belongs_to :cv
  scope :chronological_order, -> { order(created_at: :desc) }

  validates :school, presence: true
end
