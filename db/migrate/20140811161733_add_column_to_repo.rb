class AddColumnToRepo < ActiveRecord::Migration
  def change
    remove_column :repositories, :repositories
    remove_column :repositories, :star
    add_column :repositories, :is_delete, :boolean
    add_column :repositories, :is_new, :boolean
    remove_index :repositories, [:user_id, :name]
    add_index :repositories, [:user_id, :github_id], unique: true
  end
end
