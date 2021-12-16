# frozen_string_literal: true

module Users
  class RegistrationsController < ::ApplicationController
    skip_authorization_check
    before_action :load_user
    before_action :check_user_existence, only: [:create]
    before_action :generate_new_token_if_expired?, only: [:update]

    # GET /resource/sign_up
    def new; end

    # Post (signup page)
    def create
      @user = User.new(user_params)
      @user.encrypted_password = SecureRandom.hex
      yield @user if block_given?
      if @user.save
        passwordless = build_passwordless_session(@user)
        passwordless.save!
        @user.send_confirmation_instructions(passwordless.token)
        flash[:notice] = t('devise.sessions.signed_in')
        sign_in passwordless_session(passwordless.token, passwordless.authenticatable_type)
        redirect_to after_sign_in_path_for(@user)
      else
        render :new
      end
    end

    def edit
      render :edit
    end

    def update
      @user.encrypted_password = SecureRandom.hex

      if @user.update(user_params)
        if @user.unconfirmed_email != @user.email
          email_updated = @user.send_confirmation_instructions(@pl_session.token)
          flash[:notice] = t('devise.registrations.update_needs_confirmation')
        else
          @user.update(unconfirmed_email: nil)
          flash[:notice] = t('devise.registrations.updated')
        end
      else
        render :edit
        return
      end
      yield @user if block_given?

      redirect_to cv_section_path(@user.subdomain)
    end

    private

    def load_user
      @user = current_user.presence || ::User.new
    end

    def user_params
      params.require(:user).permit!
    end

    def check_user_existence
      account = User.find_by(email: user_params[:email])
      return if account.blank?

      if account.confirmed?
        flash[:error] = I18n.t('errors.registrations.account_exist_source')
        redirect_to(users.sign_in_path) && return
      else
        flash[:error] = I18n.t('errors.registrations.account_not_confirmed_source')
        redirect_to(new_users_confirmation_path) && return
      end
    end

    def passwordless_session(token, authenticatable_classname)
      @passwordless_session = ::Passwordless::Session.find_by!(
        authenticatable_type: authenticatable_classname,
        token: token
      )
    end

    # generate new token if expired
    def generate_new_token_if_expired?
      @pl_session = ::Passwordless::Session.find_by(authenticatable_id: @user.id)
      return unless @pl_session&.timed_out? || @pl_session.blank?
      new_session = build_passwordless_session(@user)
      new_session.save!
    end
  end
end
