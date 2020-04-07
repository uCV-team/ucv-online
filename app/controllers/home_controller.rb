class HomeController < ApplicationController
  layout 'theme', except: [:coming_soon]

  def coming_soon
    render 'coming_soon', layout: false
  end
end
