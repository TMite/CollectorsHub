class AddUrlKeyForPostsCollections < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :url_key, :string
    add_column :collections, :url_key, :string
  end
end
