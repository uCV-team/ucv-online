class Location < ApplicationRecord
  belongs_to :user
  scope :chronological_order, -> { order(created_at: :desc) }

  validates :address, :title, presence: true
  validates :radius, numericality: { greater_than_or_equal_to: 0 }
end
