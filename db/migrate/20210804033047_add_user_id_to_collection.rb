class AddUserIdToCollection < ActiveRecord::Migration[6.1]
  def change
    add_column :collections, :user_id, :integer
    add_index :collections, :user_id
  end
end
