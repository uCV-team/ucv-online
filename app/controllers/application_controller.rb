class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :set_current_location
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

  def tld
    @tld ||= request.host.split('.').last
  end

  def set_current_location
    return if cookies[:geo_loc].present?

    @loc ||= Geocoder.search(request.remote_ip).first
    coordinates = @loc.data['error'].present? || @loc.data.empty? ? [78.4008997, 17.4206485] : [@loc.longitude, @loc.latitude]
    cookies[:geo_loc] = { value: coordinates, path: '/', expires: 2.days.from_now }
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
