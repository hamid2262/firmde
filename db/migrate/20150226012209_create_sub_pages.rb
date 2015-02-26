class CreateSubPages < ActiveRecord::Migration
  def change
    create_table :sub_pages do |t|
      t.string :title
      t.string :seo_title
      t.text :body
      t.references :page, index: true
      t.integer :order
      t.string :slug

      t.timestamps
    end
  end
end
