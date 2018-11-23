class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.float :latitude
      t.float :longitude
      t.integer :radius
      t.string :city
      t.string :country
      t.string :geocoded_address
      t.string :original_address, null: false
      t.string :province_code
      t.string :region

      t.timestamps
    end
  end
end
