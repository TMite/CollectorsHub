class AddAllTagsToCollections < ActiveRecord::Migration[6.1]
  def change
    add_column :collections, :AllTags, :string
  end
end
