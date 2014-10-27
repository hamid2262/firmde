class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :body
      t.string :css_id
      t.string :css_classes

      t.timestamps
    end
    add_index :blocks, :title
  end
end
