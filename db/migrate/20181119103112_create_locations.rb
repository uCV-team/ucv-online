class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.float :latitude
      t.float :longitude
      t.integer :radius
      t.string :title, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
