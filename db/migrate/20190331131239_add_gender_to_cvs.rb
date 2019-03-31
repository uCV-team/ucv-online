class AddGenderToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :gender, :string, limit: 1, default: 'f'
  end
end
