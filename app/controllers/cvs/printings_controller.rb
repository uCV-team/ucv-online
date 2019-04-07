module Cvs
  class PrintingsController  < ApplicationController
    layout false
    def show
      @cv = Cv.find(params[:cv_id])
    end
  end
end
