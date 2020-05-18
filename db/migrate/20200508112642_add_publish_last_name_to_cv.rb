class AddPublishLastNameToCv < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :publish_last_name, :boolean, default: false
  end
end
