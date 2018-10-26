class ChangeEducations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :educations, :cv_id, false

    rename_column :educations, :beginning, :started_on
    rename_column :educations, :ending, :ended_on
  end
end
