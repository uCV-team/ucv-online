class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @results = Cv.full_text_search(search_param)
  end

  private

  def search_param
    params.permit(:search_term)[:search_term]
  end
end
