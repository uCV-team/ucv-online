class CreatePersonalcvs < ActiveRecord::Migration[5.2]
  def change
    create_table :personalcvs do |t|
      t.belongs_to :user, foreign_key: true
      t.string :profile_picture_url, null: false
      t.string :phone_number, null: false
      t.string :working_skills, null: false
      t.date :birth_date, null: false
      t.text :about, null: false
      t.text :skills_and_interests, null: false
      t.text :future_plans, null: false

      t.timestamps null: false
    end
  end
end
