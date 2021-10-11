class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :Tag_Name

      t.timestamps
    end
  end
end
