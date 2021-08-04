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
    loc = Geocoder.search(request.remote_ip).first
    @coordinates = loc.data['error'].present? || loc.data.empty? ? default_coordinates : [loc.longitude, loc.latitude]
  end

  private

  def default_coordinates
    locale.to_s == 'it' ? [12.5674, 41.8719] : [78.4008997, 17.4206485]
  end
end
