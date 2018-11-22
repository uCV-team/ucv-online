module LocationsHelper
  def api_token
    ENV['LOCATIONIQ_PUBLIC_KEY']
  end
end
