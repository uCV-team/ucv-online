class AddPublishedAtToCv < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :published_at, :datetime
  end
end
