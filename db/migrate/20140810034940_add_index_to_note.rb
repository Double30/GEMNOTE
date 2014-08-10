class AddIndexToNote < ActiveRecord::Migration
  def change
    add_index :notes, [:repository_id, :name], unique: true
  end
end
