class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.belongs_to :cv, foreign_key: true
      t.date :beginning
      t.date :ending
      t.string :degree
      t.string :school, null: false
      t.text :description

      t.timestamps
    end
  end
end
