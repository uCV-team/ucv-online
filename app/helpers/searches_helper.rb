module SearchesHelper
  def coordinates_list(search_results)
    search_results.map do |result|
      next if result.locations.empty?
      name = "#{result.user.first_name} #{result.user.last_name}"
      location = location_coordinates(result.locations.first)
      formatted_element(name, location)
    end.compact
  end

  private

  def formatted_element(name, location)
    {
      name: name,
      location: location
    }
  end

  def location_coordinates(location)
    {
      lat: location.latitude,
      lng: location.longitude
    }
  end
end
