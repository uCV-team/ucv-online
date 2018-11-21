class Location < ApplicationRecord
  belongs_to :user
  scope :chronological_order, -> { order(created_at: :desc) }

  geocoded_by :address

  validates :address, :title, presence: true
  validates :radius, numericality: { greater_than_or_equal_to: 0 }

  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
end
