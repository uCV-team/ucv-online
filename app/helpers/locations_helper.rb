module LocationsHelper
  def api_token
    ENV['LOCATIONIQ_API_KEY']
  end
end
