module RoutingHelper
  def registration_url
    request.subdomain.present? ? new_users_registrations_path : new_users_registrations_url(subdomain: 'it')
  end

  def session_url
    if request.subdomain.present?
      new_passwordless_sessions_path('user')
    else
      new_passwordless_sessions_url('user',
                                    subdomain: 'it')
    end
  end

  def home_page_cv_url(cv_obj)
    if request.subdomain.present?
      cv_section_path(cv_obj.user_subdomain)
    else
      cv_section_url(cv_obj.user_subdomain, subdomain: cv_obj.locale)
    end
  end
end
