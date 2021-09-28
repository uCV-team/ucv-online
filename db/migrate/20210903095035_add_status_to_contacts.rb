class AddStatusToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :status, :string, default: "new", null: false
  end
end
