Geocoder.configure(
  lookup: :location_iq,
  timeout: 15,
  api_key: ENV['LOCATIONIQ_API_KEY'],
  units: :km,
  language: 'en',
  region: 'en',
  cache: Rails.cache,
  ip_lookup: :geoip2,
  google: {
    api_key: ENV['GOOGLE_API_KEY'],
    service: :google,
    units: :km
  }
)
