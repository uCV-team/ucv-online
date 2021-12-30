module Admin
  class UsersController < Admin::BaseController
    def index
      respond_to do |format|
        format.html
        format.json { render json: ::Admin::UsersDatatable.new(view_context) }
      end
    end
  end
end
