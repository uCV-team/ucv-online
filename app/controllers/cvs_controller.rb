class CvsController < ApplicationController
  before_action :set_cv, only: %i[show edit update]
  before_action :authenticate_user!

  def show; end

  def edit; end

  def update
    if @cv.update(cv_params)
      redirect_to @cv, flash: { success: t('success.update') }
    else
      render :edit
    end
  end

  private

  def set_cv
    @cv = current_user.cv
  end

  def cv_params
    params.require(:cv).permit(:about, :birth_date, :future_plans, :interests, :phone_number, :photo, :skills,
                               :working_skills)
  end
end
