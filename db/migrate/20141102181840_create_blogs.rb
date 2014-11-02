class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :category
      t.string :slug
      t.string :body
      t.integer :user_id
      t.attachment :photo

      t.timestamps
    end
    add_index :blogs, :user_id
  end
end
