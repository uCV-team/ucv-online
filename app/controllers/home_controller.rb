class HomeController < ApplicationController
  def index; end

  def check
    val = ActiveRecord::Base.connection.execute('select 1+2 as val').first['val']
    render plain: "1+2=#{val}"
  end

  def welcome
    redirect_to new_user_registration_url
  end
end
