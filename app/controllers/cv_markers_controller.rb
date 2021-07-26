class CvMarkersController < ApplicationController
  def index
    bound_params = JSON.parse(params[:bounds])
    top, left, bottom, right = bound_params

    # TODO: Search cv depending upon selected area on map
    @formatted_results = SearchesService.new(Cv.published.includes(:user, :locations)).coordinates_list
    render json: @formatted_results
  end
end
