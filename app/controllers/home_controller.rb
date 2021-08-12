class HomeController < ApplicationController
  before_action :set_initial_map_position, only: [:index]

  def index
    @seo_title = I18n.t('home.seo_title')
    @featured_cvs = Cv.published.headshot_present.about_present.order(updated_at: :desc).limit(4)
    @featured_searches = Search.ordered.localized.limit(15)
    @cvs_last_updated_count = Cv.where('updated_at > ?', 30.days.ago).count
    @cvs_last_created_count = Cv.where('created_at > ?', 30.days.ago).count
  end

  private

  # Sets map initial +@coordinates+ and +@zoom+ based on +current_user.locations.first+ presence
  def set_initial_map_position
    return set_current_user_map_position if current_user&.locations.present?
    set_guest_map_position
  end

  # When current_user.locations are present, we use the first one to center their map
  def set_current_user_map_position
    @coordinates = [current_user.locations.first.longitude, current_user.locations.first.latitude]
    @set_zoom = 5
  end

  # Otherwise we use the client_ip
  def set_guest_map_position
    location = Geocoder.search(client_ip).first
    if location.data.empty? # we set the default @coordinates and @zoom
      @coordinates = [20, 30]
      @set_zoom = 1.8
    else # we use the location.country to determine @coordinates and @zoom
      loc = Geocoder.search(location.country).first
      @coordinates = [loc.longitude, loc.latitude]
      @set_zoom = 2.5
    end
  end

  # The client IP depends on whether they are passing through the CloudFlare CDN.
  # see: https://support.cloudflare.com/hc/en-us/articles/200170986-How-does-Cloudflare-handle-HTTP-Request-headers-
  # So, if the 'CF-Connecting-IP' is available, we use it, otherwise we rely on Rails' request.remote_ip
  def client_ip
    return request.headers['CF-Connecting-IP'] if request.headers['CF-Connecting-IP'].present?
    request.remote_ip
  end
end
