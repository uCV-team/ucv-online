class SearchesController < ApplicationController
  def create
    @search = Search.find_or_create_by!(query: search_param.downcase.squish.strip, locale: I18n.locale.to_s)
    redirect_to search_url(@search)
  end

  def show
    @search = Search.friendly.find(params[:id])
    seo_tags_for(@search)
    @search.increment!(:views)
    @total_results = @search.results.count
    @results = @search.results.page(params[:page]).per(10)
    @formatted_results = SearchesService.new(@results).coordinates_list
    respond_to do |format|
      format.html
      format.js { render partial: 'search_results' }
    end
  end

  private

  def search_param
    params.permit(:search_term)[:search_term]
  end
end
