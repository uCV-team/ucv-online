class ChangeAboutColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :cvs, :about, :text
  end
end
