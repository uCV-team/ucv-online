class CvsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_cv
  respond_to :html, :js

  def show
    if current_user.present? && current_user.id == @cv.user_id
      # User can edit CV
    elsif @cv.published?
      # public view of CV
    else
      cv_not_found_or_unpublished
    end
  end

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
    @user = User.find_by(subdomain: subdomain)
    if @user
      @cv = @user.cv
    else
      cv_not_founds
    end
  end

  def cv_params
    params.require(:cv).permit(:about, :birth_date, :birth_place, :birth_day, :birth_month, :birth_year, :future_plans, :gender, :headshot, :interests,
                               :section, :skills, :working_skills, user_attributes: [:id, :first_name, :last_name, :tel, current_location_attributes: %i[id original_address]])
  end

  def subdomain
    request.subdomain.presence || params[:subdomain]
  end

  def cv_not_found_or_unpublished
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
