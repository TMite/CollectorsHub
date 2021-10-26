class ChangeTitle < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :Title, :title
    rename_column :collections, :Title, :title
  end
end
