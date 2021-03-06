class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :category
      t.integer :imageable_id
      t.string :imageable_type
      t.attachment :img

      t.timestamps null: false
    end
    add_index :pictures, :imageable_id
  end
end
