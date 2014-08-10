class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.text :content
      t.references :repository, index: true

      t.timestamps
    end
  end
end
