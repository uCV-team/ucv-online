class AddLearningSkillsToCv < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :learning_skills, :string
  end
end
