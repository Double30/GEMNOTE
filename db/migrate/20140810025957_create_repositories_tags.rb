class CreateRepositoriesTags < ActiveRecord::Migration
  def change
    create_table :repositories_tags, :id => false  do |t|
      t.references :repository
      t.references :tag

      t.timestamps
    end
    add_index :repositories_tags, [:repository_id, :tag_id], :unique => true
  end
end
