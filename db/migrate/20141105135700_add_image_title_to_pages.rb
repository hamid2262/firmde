class AddImageTitleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :title_on_image, :string
    add_column :pages, :subtitle_on_image, :text
  end
end
