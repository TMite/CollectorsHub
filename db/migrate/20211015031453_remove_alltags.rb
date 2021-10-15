class RemoveAlltags < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :AllTags
  end
end
