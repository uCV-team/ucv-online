class CvMarkersController < ApplicationController
  load_and_authorize_resource class: Location

  def index
    bound_params = JSON.parse(params[:bounds])
    top, left, bottom, right = bound_params
    results_markers = Location
                      .includes(cv: [:user])
                      .joins(:cv)
                      .where('latitude > ? AND latitude < ? AND longitude > ? AND longitude < ? AND cvs.published = ?',
                             bottom.to_f, top.to_f, left.to_f, right.to_f, true)
    @formatted_results = SearchesService.new(results_markers).coordinates_list
    render json: @formatted_results
  end
end
