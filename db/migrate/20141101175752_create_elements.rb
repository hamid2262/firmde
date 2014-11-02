class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :tag
      t.string :klass
      t.text :body
      t.string :href
      t.integer :x
      t.integer :y
      t.integer :speed
      t.integer :start
      t.string :easing
      t.integer :slideshow_id
      t.attachment :photo

      t.timestamps
    end
    add_index :elements, :slideshow_id
  end
end
