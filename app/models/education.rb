class Education < ApplicationRecord
  belongs_to :cv

  validates :school, presence: true

  scope :chronological_order, -> { order(created_at: :desc) }
end
