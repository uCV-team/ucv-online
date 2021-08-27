class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :name
      t.string :email
      t.string :phone
      t.text   :message
      t.integer :user_id, index: true
      t.string :status, default: "new", null: false

      t.timestamps
    end
  end
end
