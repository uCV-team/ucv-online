module Cvs
  class PrintingsController < ApplicationController
    load_and_authorize_resource class: Cv
    layout false

    def show
      @cv = Cv.find(params[:cv_id])
    end
  end
end
