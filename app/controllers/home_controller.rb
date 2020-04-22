class HomeController < ApplicationController
  def index
    @cvs = Cv.published.order(created_at: :desc)
  end
end
