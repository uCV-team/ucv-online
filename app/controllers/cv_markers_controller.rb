class CvMarkersController < ApplicationController
  def index
    bound_params = JSON.parse(params[:bounds])
    top, left, bottom, right = bound_params
    results_markers = Location.includes(:cv).where('latitude > ? AND latitude < ? AND longitude > ? AND longitude < ?', bottom.to_f, top.to_f, left.to_f, right.to_f)
    @formatted_results = SearchesService.new(results_markers).coordinates_list
    render json: @formatted_results
  end
end
