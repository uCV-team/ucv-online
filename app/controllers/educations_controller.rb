class EducationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cv
  before_action :set_education, only: %i[edit update destroy]
  respond_to :html, :js

  def new
    @education = Education.new
  end

  def edit; end

  def create
    @education = @cv.educations.build(education_params)
    if @education.save
      redirect_to cv_section_path(current_user.subdomain), flash: { success: t('success.education.create') }
    else
      render 'educations/errors'
    end
  end

  def update
    if @education.update(education_params)
      redirect_to cv_section_path(current_user.subdomain), flash: { success: t('success.cv.update') }
    else
      render 'educations/errors'
    end
  end

  def destroy
    @education.destroy
    redirect_to cv_section_path(current_user.subdomain), flash: { success: t('success.education.destroy') }
  end

  private

  def set_cv
    @cv = current_user.cv
  end

  def set_education
    @education = @cv.educations.find(params[:id])
  end

  def education_params
    params.require(:education).permit(:degree, :description, :ended_on, :school, :started_on)
  end
end
