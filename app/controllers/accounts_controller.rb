class AccountsController < ApplicationController
  load_and_authorize_resource class: User

  def destroy
    current_user.destroy
    redirect_to root_path
  end
end
