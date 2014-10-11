class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :repository_id
      t.integer :user_id
      t.integer :category_id
      t.text :description
      t.boolean :is_new
      t.boolean :is_deleted

      t.timestamps
    end
    add_index :stars, [:user_id, :repository_id], unique: true
    add_index :stars, :user_id
    add_index :stars, :repository_id
    add_index :stars, :category_id
  end
end
