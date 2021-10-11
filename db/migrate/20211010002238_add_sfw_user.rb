class AddSfwUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :SFW, :boolean
  end
end
