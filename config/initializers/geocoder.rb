Geocoder.configure(
  lookup: :location_iq,
  timeout: 15,
  api_key: ENV['LOCATIONIQ_API_KEY'],
  units: :km,
  language: 'en',
  region: 'en',
  cache: Rails.cache,
  ip_lookup: :geoip2,
  geoip2: {
    file: Rails.root.join('lib', 'geocoder', 'GeoLite2-City.mmdb')
  }
)
