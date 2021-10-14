class DeleteCol < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :tagA
  end
end
