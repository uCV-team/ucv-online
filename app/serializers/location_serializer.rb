class LocationSerializer
  include JSONAPI::Serializer
  attributes :id, :latitude, :longitude

  belongs_to :cv
end
