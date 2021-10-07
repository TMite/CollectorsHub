class PostsUpdate < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :SFW, :boolean
  end
end
