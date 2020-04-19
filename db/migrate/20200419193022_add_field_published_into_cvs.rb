class AddFieldPublishedIntoCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :published, :boolean, default: false
  end
end
