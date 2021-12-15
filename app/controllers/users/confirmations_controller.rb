# frozen_string_literal: true

module Users
  class ConfirmationsController < ApplicationController
    skip_authorization_check
    before_action :load_user

    # GET /resource/confirmation/new
    def new; end

    # POST /resource/confirmation
    def create
      if @user.nil?
        redirect_to new_users_confirmation_path, flash: { notice: t('devise.confirmations.send_paranoid_instructions') }
        return
      end

      generate_new_token_if_expired?
      resource = @user.send_confirmation_instructions(@pl_session.token)
      yield resource if block_given?
      redirect_to root_path, flash: { notice: t('devise.confirmations.send_instructions') }
    end

    protected

    def user_params
      params.require(:user).permit!
    end

    def load_user
      @user = if params[:user].present?
                ::User.find_by(email: params[:user][:email])
              else
                ::User.new
              end
    end

    def generate_new_token_if_expired?
      @pl_session = ::Passwordless::Session.find_by(authenticatable_id: @user.id)
      return unless @pl_session&.timed_out? || @pl_session.blank?
      new_session = build_passwordless_session(@user)
      new_session.save!
    end
  end
end
