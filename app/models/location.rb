class Location < ApplicationRecord
  belongs_to :user
  scope :chronological_order, -> { order(created_at: :desc) }

  geocoded_by :original_address do |location, results|
    result = results.first
    if result
      location.latitude = result.latitude
      location.longitude = result.longitude
      location.city = result.city
      location.country = result.country
      location.geocoded_address = result.address
      location.province_code = result.state_code
      location.region = result.state
    end
  end

  validates :original_address, presence: true
  validates :radius, numericality: { greater_than_or_equal_to: 0 }

  after_validation :geocode, if: ->(obj) { obj.original_address.present? && obj.original_address_changed? }
end
