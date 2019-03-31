class AddHeadshotToCvs < ActiveRecord::Migration[5.2]
  def up
    add_attachment :cvs, :headshot
  end

  def down
    remove_attachment :cvs, :headshot
  end
end
