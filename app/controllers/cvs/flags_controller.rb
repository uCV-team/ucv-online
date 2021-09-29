module Cvs
  class FlagsController < ApplicationController
    skip_authorization_check
    before_action :flagged_cv, only: [:create]
    def new
      @flag = Flag.new
      render partial: 'form'
    end

    def create
      @flag = Flag.new(sanitized_flag_params)
      if @flag.save
        flash[:success] = t('.success', scope: 'flash')
      else
        flash[:error] = @flag.errors.full_messages.join(', ')
      end
      redirect_back(fallback_location: cv_section_path(@cv.subdomain))
    end

    private

    def flag_params
      params.require(:flag).permit(:cv_id, :user_id, :reason)
    end

    def sanitized_flag_params
      flag_params[:reason] << ': ' + params[:flag][:message] if params[:flag][:message].present?
      flag_params
    end

    def flagged_cv
      @cv = Cv.find_by(id: flag_params[:cv_id])
    end
  end
end
