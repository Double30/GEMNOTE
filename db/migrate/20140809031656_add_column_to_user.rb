class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :url, :string
    add_column :users, :name, :string
  end
end
