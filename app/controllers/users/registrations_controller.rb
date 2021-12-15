# frozen_string_literal: true

module Users
  class RegistrationsController < ::ApplicationController
    skip_authorization_check
    before_action :load_user

    # GET /resource/sign_up
    def new; end

    # Post signup page
    def create
      resource = User.new(user_params)
      resource.encrypted_password = SecureRandom.hex
      passwordless = build_passwordless_session(resource)
      passwordless.save!
      resource.save
      yield resource if block_given?
      if resource.persisted?
        flash[:notice] = 'Signed in successfully'
        sign_in passwordless_session(passwordless.token, passwordless.authenticatable_type)
        redirect_to after_sign_in_path_for(resource)
      else
        resource.errors[:terms_accepted_at].pop # errors[terms_accepted] will suffice
        redirect_to root_path
      end
    end

    def edit
      render :edit
    end

    def update
      @user.encrypted_password = SecureRandom.hex

      resource_updated = @user.update!(user_params)
      yield @user if block_given?
      if resource_updated
        flash[:notice] = t('devise.registrations.update_needs_confirmation') if is_flashing_format?
        redirect_to cv_section_path(@user.subdomain)
      else
        render :edit
      end
    end

    private

    def load_user
      @user = current_user.presence || ::User.new
    end

    def user_params
      params.require(:user).permit!
    end

    def passwordless_session(token, authenticatable_classname)
      @passwordless_session = ::Passwordless::Session.find_by!(
        authenticatable_type: authenticatable_classname,
        token: token
      )
    end
  end
end
