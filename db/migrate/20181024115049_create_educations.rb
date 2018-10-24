class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.belongs_to :cv, foreign_key: true
      t.date :beginning
      t.date :ending
      t.string :degree, null: false
      t.string :school, null: false
      t.text :description, default: ''

      t.timestamps null: false
    end
  end
end
