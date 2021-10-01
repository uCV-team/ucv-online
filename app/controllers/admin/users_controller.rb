class Admin::UsersController < Admin::BaseController
  skip_authorization_check
  before_action :set_user, only: [:destroy]
  def index
    @users = User.order('created_at DESC') #.page(params[:page]).per(10)
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
