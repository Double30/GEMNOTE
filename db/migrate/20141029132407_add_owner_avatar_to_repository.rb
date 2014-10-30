class AddOwnerAvatarToRepository < ActiveRecord::Migration
  def change
    add_column :repositories, :owner_avatar, :string
  end
end
