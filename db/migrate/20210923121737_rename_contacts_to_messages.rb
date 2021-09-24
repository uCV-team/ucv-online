class RenameContactsToMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :message, :content
    rename_table :contacts, :messages
  end
end
