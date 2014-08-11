class AddColumnToRepository < ActiveRecord::Migration
  def change
    add_column :repositories, :repositories, :string
    add_column :repositories, :github_id, :integer
    add_column :repositories, :github_description, :text
    add_column :repositories, :full_name, :string
    add_column :repositories, :stargazers_count, :integer
    add_column :repositories, :owner_id, :integer
    add_column :repositories, :owner_name, :string
  end
end
