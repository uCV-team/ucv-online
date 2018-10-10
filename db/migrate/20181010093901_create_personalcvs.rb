class CreatePersonalcvs < ActiveRecord::Migration[5.2]
  def change
    create_table :personalcvs do |t|
      t.belongs_to :user, foreign_key: true
      t.string :profile_picture_url,  null: false, default: ""
      t.string :phone_number,         null: false, default: ""
      t.string :working_skills,       null: false, default: ""
      t.date   :birth_date,           null: false
      t.text   :about,                null: false, default: ""
      t.text   :skills_and_interests, null: false, default: ""
      t.text   :future_plans,         null: false, default: ""

      t.timestamps null: false
    end
  end
end
