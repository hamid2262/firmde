class CreatePageBackups < ActiveRecord::Migration
  def up
    create_table :page_backups do |t|
      t.integer :user_id
      t.integer :page_id
      t.string :title
      t.text :body
      t.string :slug
      t.text :subtitle_on_image
      t.text :title_on_image

      t.timestamps
    end
    add_index  :page_backups, :user_id
    add_index  :page_backups, :page_id

    Page.all.each do |page|
      PageBackup.create(page_id: page.id, title: page.title, body: page.body,  
        subtitle_on_image: page.subtitle_on_image,  title_on_image: page.title_on_image )
    end
    
  end

  def down
    drop_table :page_backups
  end
end
