class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.belongs_to :cv, foreign_key: true, null: false
      t.date :started_on
      t.date :ended_on
      t.string :company, null: false
      t.string :location
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
