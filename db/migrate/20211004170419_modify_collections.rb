class ModifyCollections < ActiveRecord::Migration[6.1]
  def change
    remove_column :collections, :Height, :integer
    add_column :collections, :SFW, :boolean
    add_column :collections, :Private, :boolean
  end
end
