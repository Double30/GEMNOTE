class AddIndexToRepository < ActiveRecord::Migration
  def change
    add_index :repositories, [:user_id, :name], unique: true
  end
end
