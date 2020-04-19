class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cv
  before_action :set_experience, only: %i[edit update destroy]
  respond_to :html, :js

  def new
    @experience = Experience.new
  end

  def edit; end

  def create
    @experience = @cv.experiences.build(experience_params)
    if @experience.save
      redirect_to cv_url, flash: { success: t('success.experience.create') }
    else
      render 'experiences/errors'
    end
  end

  def update
    if @experience.update(experience_params)
      redirect_to cv_url, flash: { success: t('success.cv.update') }
    else
      render 'experiences/errors'
    end
  end

  def destroy
    @experience.destroy
    redirect_to cv_url, flash: { success: t('success.experience.destroy') }
  end

  private

  def set_cv
    @cv = current_user.cv
  end

  def set_experience
    @experience = @cv.experiences.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:company, :description, :ended_on, :location, :started_on, :title, :website_url)
  end
end
