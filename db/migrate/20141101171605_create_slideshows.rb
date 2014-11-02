class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.string :transition
      t.integer :slotamount
      t.integer :masterspeed
      t.integer :delay
      t.attachment :background

      t.timestamps
    end
  end
end
