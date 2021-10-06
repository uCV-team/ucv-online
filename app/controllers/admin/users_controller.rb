class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:destroy]
  def index; end

  def records
    users = User.datatable_filter(params['search']['value'], params['columns'])
    filtered_users = users.count

    users = users.datatable_order(params['order']['0']['column'].to_i,
                                  params['order']['0']['dir'])
    page_number = (params['start'].to_i / params['length'].to_i) + 1
    users = users.page(page_number).per(params['length'])
    render json: { data: users,
                   draw: params['draw'].to_i,
                   recordsTotal: User.count,
                   recordsFiltered: filtered_users }
  end

  # def destroy
  #   debugger
  #   @user.destroy!
  # end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
