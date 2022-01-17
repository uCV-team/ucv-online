module Admin
  class DashboardsController < Admin::BaseController
    authorize_resource

    def show; end
  end
end
