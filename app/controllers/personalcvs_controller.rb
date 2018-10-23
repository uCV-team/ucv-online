class PersonalcvsController < ApplicationController
  before_action :set_personalcv, only: %i[show edit update]
  before_action :authenticate_user!

  def show; end

  def new
    @personalcv = Personalcv.new
  end

  def edit; end

  def create
    @personalcv = Personalcv.new(personalcv_params.merge(user: current_user))

    if @personalcv.save
      redirect_to @personalcv, flash: { success: t('success.create') }
    else
      render :new
    end
  end

  def update
    if @personalcv.update(personalcv_params)
      redirect_to @personalcv, flash: { success: t('success.update') }
    else
      render :edit
    end
  end

  private

  def set_personalcv
    @personalcv = current_user.personalcv
  end

  def personalcv_params
    params.require(:personalcv).permit(:about, :birth_date, :future_plans, :phone_number, :profile_picture_url,
                                       :skills_and_interests, :working_skills)
  end
end
