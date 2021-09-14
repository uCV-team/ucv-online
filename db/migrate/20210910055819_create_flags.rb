class CreateFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :flags do |t|
      t.integer :user_id
      t.integer :cv_id
      t.string :reason

      t.timestamps
    end
  end
end
