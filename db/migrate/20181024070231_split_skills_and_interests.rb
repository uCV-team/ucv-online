class SplitSkillsAndInterests < ActiveRecord::Migration[5.2]
  def change
    rename_column :cvs, :skills_and_interests, :skills
    add_column :cvs, :interests, :text
    change_column_default :cvs, :interests, from: nil, to: ''
  end
end
