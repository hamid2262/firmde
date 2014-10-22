class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.attachment :photo
      t.integer :parent_id
      t.string :slug

      t.timestamps
    end
  end
end
