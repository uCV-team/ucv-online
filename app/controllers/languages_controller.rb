class LanguagesController < ApplicationController
  load_and_authorize_resource
  before_action :set_cv
  before_action :set_language, only: %i[edit update destroy]
  respond_to :html, :js

  def new
    @language = Language.new
  end

  def edit; end

  def create
    @language = @cv.languages.build(language_params)
    respond_to do |format|
      if @language.save
        format.js { render 'index' }
      else
        format.js { render 'languages/errors' }
      end
    end
  end

  def update
    respond_to do |format|
      if @language.update(language_params)
        format.js { render 'index' }
      else
        format.js { render 'languages/errors' }
      end
    end
  end

  def destroy
    @language.destroy
    redirect_to cv_section_path(current_user.subdomain), flash: { success: t('success.language.destroy') }
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
