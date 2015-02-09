class AddSeoTitleToPage < ActiveRecord::Migration
  def change
    add_column :pages, :seo_title, :string
  end
end
