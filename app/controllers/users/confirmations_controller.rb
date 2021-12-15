# frozen_string_literal: true

module Users
  class ConfirmationsController < ApplicationController
    skip_authorization_check
    before_action :load_user

    # GET /resource/confirmation/new
    def new; end

    # POST /resource/confirmation
    def create
      # TODO: Confirmation mail.
      resource = ::User.send_confirmation_instructions(user_params)
      yield resource if block_given?

      flash[:notice] = if resource.errors.empty?
                         'Mail will be sent if it exists'
                       else
                         'You will receive an email with the instructions'
                       end
      redirect_to root_path
    end

    protected

    def user_params
      params.require(:user).permit!
    end

    def load_user
      @user = ::User.find_by(id: params[:id]) || ::User.new
    end
  end
end
