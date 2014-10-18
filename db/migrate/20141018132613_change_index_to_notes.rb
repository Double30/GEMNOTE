class ChangeIndexToNotes < ActiveRecord::Migration
  def change
    remove_index :notes, :star_id
    add_index :notes, :star_id
  end
end
