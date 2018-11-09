class RegistrationsController < Devise::RegistrationsController
  protected

  # :reek:UtilityFunction
  def update_resource(resource, params)
    resource.update_without_password(params.except('current_password', 'email'))
  end
end
