class AddOnlineUpdatesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_preference_online_updates, :boolean, default: false
  end
end
