class HomeController < ApplicationController
  before_action :set_current_location, only: [:index]

  def index
    @seo_title = I18n.t('home.seo_title')
    nearby_cvs # Fetch cvs near by to user current location within radius of 500 Km
    @featured_cvs = Cv.published.headshot_present.about_present.order(updated_at: :desc).limit(4)
    @featured_searches = Search.ordered.localized.limit(15)
    @cvs_last_updated_count = Cv.where('updated_at > ?', 30.days.ago.beginning_of_day).count
    @cvs_last_created_count = Cv.where('created_at > ?', 30.days.ago.beginning_of_day).count
    @formatted_results = SearchesService.new(Cv.published.includes(:user, :locations)).coordinates_list
  end

  def set_current_location
    loc = Geocoder.search(request.remote_ip).first
    @coordinates = loc.data['error'].present? || loc.data.empty? ? default_coordinates : [loc.longitude, loc.latitude]
  end

  # Note: Distance is in miles
  def nearby_cvs
    @cvs = Cv.from("(select cvs.id, SQRT(POW(69.1 * (latitude - #{@coordinates[1]}), 2) + POW(69.1 *
                    ((#{@coordinates[0]} - longitude) * COS(latitude / 57.3)), 2)) AS distance FROM
                    cvs INNER JOIN users ON users.id = cvs.user_id INNER JOIN locations ON
                    locations.user_id = users.id ORDER BY distance) vt, cvs")
             .where('vt.distance < ?', 311)
             .uniq
  end

  private

  def default_coordinates
    locale.to_s == 'it' ? [12.5674, 41.8719] : [78.4008997, 17.4206485]
  end
end
