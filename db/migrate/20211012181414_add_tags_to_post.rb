class AddTagsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :tagA, :string, array: true, default: [].to_yaml
  end
end
