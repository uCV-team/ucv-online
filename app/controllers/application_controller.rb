class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  check_authorization unless: :devise_controller?
  before_action :set_locale
  before_action :set_req_subdomain
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notifications, if: proc { current_user.present? }
  helper_method :root_domain_url
  include Passwordless::ControllerHelpers
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: I18n.t('flash.authorization') }
    end
  end

  def seo_tags_for(resource)
    @seo_title = resource.seo_title
    # TODO: @seo_description = resource.seo_description
  end

  protected

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user
    redirect_to root_path, flash: { error: I18n.t('flash.authorization') }
  end

  def set_locale
    return I18n.locale = ENV['DEVELOPMENT_LOCALE'].to_sym if ENV['DEVELOPMENT_LOCALE'].present?

    custom_locale = if current_user.present? && current_user.locale.present?
                      current_user.locale
                    else
                      locale_by_host
                    end
    I18n.locale = custom_locale.to_sym
  end

  def after_sign_in_path_for(resource)
    if resource.role?('admin')
      admin_dashboard_path
    else
      cv_section_path(resource.subdomain)
    end
  end

  def root_domain_url
    if request.subdomain.present?
      "http://#{request.subdomain}.#{ENV['SERVER_HOST']}"
    else
      ENV['SERVER_URL']
    end
  end

  def notifications
    @all_messages = current_user.messages.where(status: 'new')
  end

  def set_req_subdomain
    sub_domain = request.host.split('.').first
    return if current_user.blank? || current_user.locale == sub_domain || sub_domain == 'www' || sub_domain == '127'

    redirect_to "http://#{current_user.locale}.#{ENV['SERVER_HOST']}#{request.path}",
                alert: t('flash.url_update_html')
  end

  private

  def locale_by_host
    I18n.available_locales.map(&:to_s).include?(request.subdomain) ? request.subdomain : 'it'
  end

  def user_not_authorized
    flash[:alert] = I18n.t('flash.authorization')
    redirect_to(request.referer || root_path)
  end
end
