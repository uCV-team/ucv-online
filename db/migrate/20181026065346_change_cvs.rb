class ChangeCvs < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cvs, :user_id, false

    %i[photo phone_number working_skills about skills future_plans interests].each do |column|
      change_column_default :cvs, column, from: '', to: nil
    end
  end
end
