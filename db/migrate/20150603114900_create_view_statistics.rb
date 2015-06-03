class CreateViewStatistics < ActiveRecord::Migration
  def change
    create_table :view_statistics do |t|
      t.string :viewer_ip
      t.string :page
      t.string :section
      t.string :referer

      t.timestamps null: false
    end
  end
end
