class SearchesController < ApplicationController
  skip_authorization_check

  def create
    if search_param.present?
      @search = Search.find_or_create_by(query: sanitized_query, locale: I18n.locale.to_s)
      redirect_to search_url(@search, subdomain: I18n.locale.to_s)
    else
      flash[:error] = t('flash.searches.query_blank')
      redirect_to root_domain_url
    end
  end

  def show
    @search = Search.friendly.find(params[:id])
    seo_tags_for(@search)
    @search.increment!(:views)
    @all_results = @search.materialized_views_results
    @total_results = @all_results.count
    @results = @all_results.page(params[:page]).per(10)
    @formatted_results = SearchesService.new(@all_results.includes(cv: [:user])).coordinates_list
    search_map_center
    respond_to do |format|
      format.html
      format.js { render partial: 'search_results' }
    end
  end

  private

  def search_param
    params.permit(:search_query)[:search_query]
  end

  def sanitized_query
    Search.sanitized_query(search_param)
  end

  def search_map_center
    final_results = @all_results.select(&:latitude)
    if final_results.any?
      lat = final_results.first.latitude
      lng = final_results.first.longitude
      @coordinates = [lng, lat]
      @set_zoom = 2.5
    else
      @coordinates = [20, 50]
      @set_zoom = 0.9
    end
  end
end
