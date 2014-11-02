class CreateSiteSettings < ActiveRecord::Migration
  def change
    create_table :site_settings do |t|
      t.string :site_name
      t.attachment :logo
      t.attachment :favicon

      t.timestamps
    end
  end
end
