class ChangeName < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :title, :Title
  end
end
