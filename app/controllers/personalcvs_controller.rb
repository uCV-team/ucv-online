class PersonalcvsController < ApplicationController
  before_action :set_personalcv, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def show; end

  def new
    @personalcv = Personalcv.new
  end

  def edit; end

  def create
    @personalcv = Personalcv.new(personalcv_params.merge(user: current_user))

    if @personalcv.save
      redirect_to @personalcv, flash: { success: t('personalcv.success.create') }
    else
      render :new
    end
  end

  def update
    if @personalcv.update(personalcv_params)
      redirect_to @personalcv, flash: { success: t('personalcv.success.update') }
    else
      render :edit
    end
  end

  def destroy
    @personalcv.destroy
    redirect_to personalcv_url, flash: { success: t('personalcv.success.destroy') }
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
