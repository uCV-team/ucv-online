class ChangePersonalcv < ActiveRecord::Migration[5.2]
  def change
    rename_table :personalcvs, :cvs
    rename_column :cvs, :profile_picture_url, :photo

    (Cv.column_names - %w(id user_id created_at updated_at)).each do |column_name|
      change_column_null :cvs, column_name, true
      change_column_default :cvs, column_name, from: nil, to: '' unless column_name == 'birth_date'
    end
  end
end
