class AddPhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tel, :string, limit: 255
    remove_column :cvs, :phone_number, :string, limit: 255
  end
end
