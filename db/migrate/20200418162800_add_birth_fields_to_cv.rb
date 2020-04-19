class AddBirthFieldsToCv < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :birth_day, :string
    add_column :cvs, :birth_month, :string
    add_column :cvs, :birth_year, :string
  end
end
