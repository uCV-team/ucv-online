class LanguagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cv
  before_action :set_language, only: %i[edit update destroy]
  respond_to :html, :js

  def new
    @language = Language.new
  end

  def edit; end

  def create
    @language = @cv.languages.build(language_params)
    if @language.save
      redirect_to cv_url, flash: { success: t('success.language.create') }
    else
      render 'educations/errors'
    end
  end

  def update
    if @language.update(language_params)
      redirect_to cv_url, flash: { success: t('success.cv.update') }
    else
      render 'educations/errors'
    end
  end

  def destroy
    @language.destroy
    redirect_to cv_url, flash: { success: t('success.language.destroy') }
  end

  private

  def set_cv
    @cv = current_user.cv
  end

  def set_language
    @language = @cv.languages.find(params[:id])
  end

  def language_params
    params.require(:language).permit(:language, :level)
  end
end
