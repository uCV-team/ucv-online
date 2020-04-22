class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    initalize_variables
    respond_to do |format|
      format.html
      format.js { render partial: 'search_results' }
    end
  end

  private

  def initalize_variables
    results = Cv.full_text_search(search_param)
    @total_results = results.count
    @results = results.page(params[:page]).per(10)
    @formatted_results = SearchesService.new(@results).coordinates_list
  end

  def search_param
    params.permit(:search_term)[:search_term]
  end
end
