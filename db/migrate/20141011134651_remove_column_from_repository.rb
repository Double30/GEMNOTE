class RemoveColumnFromRepository < ActiveRecord::Migration
  def change
    remove_column :repositories, :is_delete
    remove_column :repositories, :is_new
    remove_column :repositories, :user_id
    remove_column :repositories, :category_id
  end
end
