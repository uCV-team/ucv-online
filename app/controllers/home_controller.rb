class HomeController < ApplicationController
  before_action :set_current_location, only: [:index]

  def index
    @seo_title = I18n.t('home.seo_title')
    @featured_cvs = Cv.published.headshot_present.about_present.order(updated_at: :desc).limit(4)
    @featured_searches = Search.ordered.localized.limit(15)
    @cvs_last_updated_count = Cv.where('updated_at > ?', 30.days.ago).count
    @cvs_last_created_count = Cv.where('created_at > ?', 30.days.ago).count
  end

  def set_current_location
    if current_user.present? && current_user.locations.present?
      @coordinates = [current_user.locations.first.longitude, current_user.locations.first.latitude]
      @set_zoom = 5
    else
      location = Geocoder.search(request.remote_ip).first
      if location.data.empty?
        @coordinates = [20, 30]
        @set_zoom = 1.8
      else
        loc = Geocoder.search(location.country).first
        @coordinates = [loc.longitude, loc.latitude]
        @set_zoom = 2.5
      end
    end
  end
end
