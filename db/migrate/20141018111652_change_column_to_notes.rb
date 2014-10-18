class ChangeColumnToNotes < ActiveRecord::Migration
  def up
    add_column :notes, :star_id, :integer
    remove_column :notes, :repository_id

    add_index :notes, [:star_id, :name], unique: true
    add_index :notes, :star_id, unique: true
  end

  def down
    remove_column :notes, :star_id
    add_column :notes, :repository_id, :integer
  end
end
