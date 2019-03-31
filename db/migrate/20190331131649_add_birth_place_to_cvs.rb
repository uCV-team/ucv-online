class AddBirthPlaceToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :birth_place, :string
  end
end
