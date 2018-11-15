class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.belongs_to :cv, foreign_key: true, null: false
      t.string :language
      t.string :level

      t.timestamps
    end
  end
end
