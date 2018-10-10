class HomeController < ApplicationController
  before_action :authenticate_user!, except: :check

  def index; end

  def check
    val = ActiveRecord::Base.connection.execute('select 1+2 as val').first['val']
    render plain: "1+2=#{val}"
  end
end
