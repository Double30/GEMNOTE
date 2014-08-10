class AddIndexToTag < ActiveRecord::Migration
  def change
    add_index :tags, [:user_id, :name], unique: true
  end
end
