class AddIndexToCategory < ActiveRecord::Migration
  def change
    add_index :categories, [:user_id, :name], unique: true
  end
end
