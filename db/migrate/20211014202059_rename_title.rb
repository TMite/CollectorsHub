class RenameTitle < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :title, :Title
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
