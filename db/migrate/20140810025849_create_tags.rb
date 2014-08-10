class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :color
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
