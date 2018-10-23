class ChangePersonalcv < ActiveRecord::Migration[5.2]
  def change
    rename_table :personalcvs, :cvs
    rename_column :cvs, :profile_picture_url, :photo
    change_column_null :cvs, :photo, true
    change_column_null :cvs, :phone_number, true
    change_column_null :cvs, :working_skills, true
    change_column_null :cvs, :birth_date, true
    change_column_null :cvs, :about, true
    change_column_null :cvs, :skills_and_interests, true
    change_column_null :cvs, :future_plans, true
  end
end
