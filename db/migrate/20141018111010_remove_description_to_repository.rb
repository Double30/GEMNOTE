class RemoveDescriptionToRepository < ActiveRecord::Migration
  def up
    remove_column :repositories, :description
  end
  def down
    add_column :repositories, :description, :text
  end
end
