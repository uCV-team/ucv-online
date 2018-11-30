class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    if search_param.present?
      @results = Cv.full_text_search(search_param)
      @formatted_results = SearchesService.new(@results.first(10)).coordinates_list
      respond_to do |format|
        format.js { render partial: 'search_results' }
      end
    else
      @results = []
    end
  end

  private

  def search_param
    params.permit(:search_term)[:search_term]
  end
end
