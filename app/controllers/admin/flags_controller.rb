module Admin
  class FlagsController < Admin::BaseController
    def index
      respond_to do |format|
        format.html
        format.json { render json: ::Admin::FlagsDatatable.new(view_context) }
      end
    end
  end
end
