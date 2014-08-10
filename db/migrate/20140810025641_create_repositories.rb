class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.integer :star
      t.string :url
      t.text :description
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
