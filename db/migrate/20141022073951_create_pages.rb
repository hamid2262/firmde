class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :parent_id
      t.integer :order
      t.string :slug
      t.attachment :photo

      t.timestamps
    end
  end
end
