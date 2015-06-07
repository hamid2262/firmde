class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.string :ip
      t.string :head

      t.timestamps null: false
    end
    add_index :crawlers, :ip
    add_index :crawlers, :head
  end
end
