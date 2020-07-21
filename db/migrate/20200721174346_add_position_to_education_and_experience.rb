class AddPositionToEducationAndExperience < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :position, :integer, default: 0
    add_column :educations, :custom_sort, :boolean, default: false
    add_column :experiences, :position, :integer, default: 0
    add_column :experiences, :custom_sort, :boolean, default: false
  end
end
