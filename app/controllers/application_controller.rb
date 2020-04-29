class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    params[:user][:locale] = I18n.locale if params[:user].present?
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name tel subdomain locale])
  end

  def set_locale
    I18n.locale = case tld
                  when 'it'
                    :it
                  else
                    :en
                  end
  end

  def after_sign_in_path_for(resource)
    cv_section_path(resource.subdomain)
  end

  def tld
    @tld ||= request.host.split('.').last
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
