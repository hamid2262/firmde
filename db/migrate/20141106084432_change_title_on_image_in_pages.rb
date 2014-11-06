class ChangeTitleOnImageInPages < ActiveRecord::Migration
  def change
    remove_column :pages, :title_on_image, :string
    add_column :pages, :title_on_image, :text
  end
end
