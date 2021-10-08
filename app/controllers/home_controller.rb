class HomeController < ApplicationController
  include InitialMapCentering
  skip_authorization_check
  before_action :set_initial_map_position, only: [:index]

  def index
    @seo_title = I18n.t('home.seo_title')
    @featured_cvs = Cv.published.headshot_present.about_present.experience_present.order(updated_at: :desc).uniq.take(4)
    @featured_searches = Search.ordered.localized.limit(15)
    @cvs_last_updated_count = Cv.where('updated_at > ?', 30.days.ago).count
    @cvs_last_created_count = Cv.where('created_at > ?', 30.days.ago).count
  end
end
