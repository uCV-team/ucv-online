class SearchesService
  def initialize(search_results)
    @search_results = search_results
  end

  # :reek:FeatureEnvy
  def coordinates_list
    {
      type: 'FeatureCollection',
      crs: {
        type: 'name',
        properties: {
          name: 'urn:ogc:def:crs:OGC:1.3:CRS84'
        }
      },
      features: features
    }
  end

  def features
    @search_results.map do |result|
      next if result.latitude.nil?

      {
        type: 'Feature',
        properties: properties(result.cv),
        geometry: geometry(result)
      }
    end.compact
  end

  private

  def properties(result)
    {
      id: result.id,
      subdomain: result.subdomain,
      name: result.abbr_name
    }
  end

  def geometry(location)
    {
      type: 'Point',
      coordinates: [
        location.longitude,
        location.latitude
      ]
    }
  end
end
