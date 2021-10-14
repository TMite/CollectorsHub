class AddAllTags < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :AllTags, :string
  end
end
