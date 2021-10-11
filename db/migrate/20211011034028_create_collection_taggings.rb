class CreateCollectionTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_taggings do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
