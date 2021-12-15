# frozen_string_literal: true

require 'bcrypt'

module Passwordless
  # Controller for managing Passwordless sessions
  class SessionsController < ApplicationController
    include ControllerHelpers
    include Rails.application.routes.url_helpers
    skip_authorization_check

    # get '/sign_in'
    #   Assigns an email_field and new Session to be used by new view.
    #   renders sessions/new.html.erb.
    def new
      @email_field = email_field
      @session = Session.new

      render template: 'users/sessions/new'
    end

    # post '/sign_in'
    #   Creates a new Session record then sends the magic link
    #   renders sessions/create.html.erb.
    # @see Mailer#magic_link Mailer#magic_link
    def create
      @resource = find_authenticatable
      session = build_passwordless_session(@resource)

      if session.save
        if Passwordless.after_session_save.arity == 2
          Passwordless.after_session_save.call(session, request)
        else
          Passwordless.after_session_save.call(session)
        end
        flash[:notice] = t('devise.sessions.login')
      else
        flash[:notice] = t('errors.sessions.sign_in_with_wrong_email')
      end

      redirect_to passwordless_success_redirect_path
    end

    def show
      # Make it "slow" on purpose to make brute-force attacks more of a hassle
      user = Passwordless::Session.find_by(token: params[:token])&.authenticatable
      return if user.blank?
      user_confirmation(user)

      BCrypt::Password.create(params[:token])
      sign_in passwordless_session if current_user.blank?

      redirect_to passwordless_success_redirect_path
    rescue Errors::TokenAlreadyClaimedError
      flash[:error] = I18n.t('.passwordless.sessions.create.token_claimed')
      redirect_to passwordless_failure_redirect_path
    rescue Errors::SessionTimedOutError
      flash[:error] = I18n.t('.passwordless.sessions.create.session_expired')
      redirect_to passwordless_failure_redirect_path
    end

    def destroy
      sign_out authenticatable_class
      redirect_to passwordless_sign_out_redirect_path
    end

    protected

    def passwordless_sign_out_redirect_path
      Passwordless.sign_out_redirect_path
    end

    def passwordless_failure_redirect_path
      Passwordless.failure_redirect_path
    end

    def passwordless_query_redirect_path
      query_redirect_uri = URI(params[:destination_path])
      query_redirect_uri.to_s if query_redirect_uri.host.present?
    rescue URI::InvalidURIError, ArgumentError
      nil
    end

    def passwordless_success_redirect_path
      return Passwordless.success_redirect_path unless Passwordless.redirect_back_after_sign_in

      session_redirect_url = reset_passwordless_redirect_location!(authenticatable_class)
      passwordless_query_redirect_path || session_redirect_url || Passwordless.success_redirect_path
    end

    private

    def authenticatable
      params.fetch(:authenticatable)
    end

    def authenticatable_classname
      authenticatable.to_s.camelize
    end

    def authenticatable_class
      authenticatable_classname.constantize
    end

    def email_field
      authenticatable_class.passwordless_email_field
    end

    def find_authenticatable
      email = params[:user][:email].downcase.strip

      if authenticatable_class.respond_to?(:fetch_resource_for_passwordless)
        authenticatable_class.fetch_resource_for_passwordless(email)
      else
        authenticatable_class.where("lower(#{email_field}) = ?", email).first
      end
    end

    def passwordless_session
      @passwordless_session ||= Session.find_by!(
        authenticatable_type: authenticatable_classname,
        token: params[:token]
      )
    end

    def user_confirmation(user)
      if user.confirmed? && user.unconfirmed_email.nil?
        flash[:notice] = I18n.t('devise.sessions.signed_in')
      else
        user.confirm
        flash[:notice] = I18n.t('devise.confirmations.confirmed')
      end
    end
  end
end
