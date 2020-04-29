class HomeController < ApplicationController
  before_action :set_current_location, only: [:index]

  def index
    @cvs = Cv.published.with_headshot.order(published_at: :desc)
  end

  def set_current_location
    @loc ||= Geocoder.search('169.149.220.44').first
    @coordinates = @loc.data['error'].present? || @loc.data.empty? ? [78.4008997, 17.4206485] : [@loc.longitude, @loc.latitude]
  end
end
