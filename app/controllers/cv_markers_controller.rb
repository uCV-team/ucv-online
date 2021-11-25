class CvMarkersController < ApplicationController
  load_and_authorize_resource class: Location

  def index
    bound_params = JSON.parse(params[:bounds])
    top, left, bottom, right = bound_params
    serialized_data = Rails.cache.fetch(markers_cache_key, expires_in: 1.day) do
      results_markers = Location
                        .includes(cv: [:user])
                        .joins(:cv)
                        .where('latitude IS NOT NULL AND latitude > ? AND latitude < ? AND longitude > ?
                                AND longitude < ? AND cvs.published = ?',
                               bottom.to_f, top.to_f, left.to_f, right.to_f, true)

      LocationSerializer.new(results_markers, include: [:cv]).serializable_hash
    end
    render json: serialized_data
  end

  private

  def markers_cache_key
    "markers_#{params[:bounds]}"
  end
end
