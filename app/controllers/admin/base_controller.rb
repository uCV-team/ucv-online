module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :authorize_admin

    def authorize_admin
      record = if respond_to?(:model_class, true) && model_class
                 model_class
               else
                 controller_name.to_sym
               end
      authorize! :admin, record
      authorize! params[:action].to_sym, record
    end
  end
end
