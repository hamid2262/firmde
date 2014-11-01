class CreateKundens < ActiveRecord::Migration
  def change
    create_table :kundens do |t|
      t.string :name
      t.string :url
      t.attachment :photo
      t.attachment :photo_gray

      t.timestamps
    end
  end
end
