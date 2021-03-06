class CvsController < ApplicationController
  load_and_authorize_resource
  before_action :set_cv, only: [:show]
  before_action :find_cv, only: %i[edit update download]
  respond_to :html, :js

  def show
    # cannot access unpublished Cv except self
    authorize! :read, @cv
  rescue CanCan::AccessDenied
    redirect_to params[:user_subdomain] ? root_domain_url : unauthorized_path
  end

  def edit
    if Cv::CV_SECTIONS.include? params[:section]
      render "edit_#{params[:section]}"
    else
      redirect_to cv_section_path(current_user.subdomain)
    end
  end

  def update
    @user = current_user

    respond_to do |format|
      if @cv.update(cv_params)
        format.html { redirect_to cv_section_path(@user.subdomain), flash: { success: flash_message } }
        format.js {}
      else
        format.html { redirect_to cv_settings_path(@cv.id), flash: { alert: @cv.errors.full_messages.first } }
        format.js { render 'errors' }
      end
    end
  end

  def download
    pdf_html = ApplicationController.new.render_to_string(
      template: 'cvs/printings/show',
      locals: { :@cv => @cv, :@user => current_user },
      layout: 'pdf'
    )
    pdf = WickedPdf.new.pdf_from_string(pdf_html, footer: { left: '[page] / [topage]' })
    send_data pdf, filename: 'cv.pdf'
  end

  private

  def set_cv
    @user = User.find_by(subdomain: subdomain)
    if @user
      @cv = @user.cv
    else
      redirect_to root_domain_url
    end
  end

  def find_cv
    @cv = if params[:id]
            Cv.find_by(id: params[:id], user_id: current_user.id)
          else
            current_user.cv
          end
  end

  def flash_message
    params[:cv][:internship] ? t('.success', scope: :flash) : t('.success_cv', scope: :flash)
  end

  def cv_params
    params.require(:cv).permit(:about, :birth_date, :birth_place, :birth_day, :birth_month, :birth_year, :future_plans,
                               :gender, :headshot, :interests, :published, :section, :skills, :working_skills,
                               :learning_skills, :remove_headshot, :authorization_statement, :publish_last_name,
                               :internship, :temporary_contract, :permanent_contract, :freelance, :part_time,
                               :full_time, :in_person, :remote_work, :relocate, :notice_period,
                               :expected_salary_cents, :expected_salary_currency,
                               user_attributes: [:id, :first_name, :last_name, :tel,
                                                 { current_location_attributes: %i[id original_address] }])
  end

  def subdomain
    params[:user_subdomain] || request.subdomain.presence
  end
end
