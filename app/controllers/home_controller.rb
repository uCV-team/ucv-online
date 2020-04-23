class HomeController < ApplicationController
  def index
    @cvs = Cv.published.order(published_at: :desc)
  end
end
