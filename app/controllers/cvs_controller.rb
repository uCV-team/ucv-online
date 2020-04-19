class CvsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cv
  respond_to :html, :js

  def show; end

  def edit
    if Cv::CV_SECTIONS.include? params[:section]
      render "edit_#{params[:section]}"
    else
      redirect_to cv_path
    end
  end

  def update
    if @cv.update(cv_params)
      redirect_to @cv, flash: { success: t('success.cv.update') }
    else
      render 'errors'
    end
  end

  private

  def set_cv
    @cv = if params[:id]
            Cv.find(params[:id])
          else
            current_user.cv
    end
  end

  def cv_params
    params.require(:cv).permit(:about, :birth_date, :birth_place, :birth_day, :birth_month, :birth_year, :future_plans, :gender, :headshot, :interests,
                               :section, :skills, :working_skills, user_attributes: [:id, :first_name, :last_name, :tel, current_location_attributes: %i[id original_address]])
  end
end
