class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :Title
      t.text :Description
      t.integer :Height

      t.timestamps
    end
  end
end
