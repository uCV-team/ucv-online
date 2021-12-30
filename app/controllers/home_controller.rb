class HomeController < ApplicationController
  include InitialMapCentering
  skip_authorization_check
  before_action :set_initial_map_position, only: [:index]

  def index
    @seo_title = I18n.t('home.seo_title')
    @featured_cvs = Cv.featured_last_4
    @featured_searches = Search.ordered.localized.limit(15)
    @cvs_last_updated_count = Cv.where('updated_at > ?', 30.days.ago).count
  end

  def show; end
end
