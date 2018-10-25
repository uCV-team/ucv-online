class EducationsController < ApplicationController
  before_action :set_cv
  before_action :set_education, only: %i[edit update destroy]

  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
  end

  def edit; end

  def create
    @education = @cv.educations.new(education_params)
    if @education.save
      redirect_to cv_educations_url, flash: { success: t('success.education.create') }
    else
      render :new
    end
  end

  def update
    if @education.update(education_params)
      redirect_to cv_educations_url, flash: { success: t('success.education.update') }
    else
      render :edit
    end
  end

  def destroy
    @education.destroy
    redirect_to cv_educations_url, flash: { success: t('success.education.destroy') }
  end

  private

  def set_cv
    @cv = current_user.cv
  end

  def set_education
    @education = @cv.educations.find(params[:id])
  end

  def education_params
    params.require(:education).permit(:beginning, :degree, :description, :ending, :school)
  end
end
