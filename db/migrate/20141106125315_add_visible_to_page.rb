class AddVisibleToPage < ActiveRecord::Migration
  def change
    add_column :pages, :visible_on_sidebar, :boolean, default: true
    add_column :pages, :visible_on_navbar, :boolean, default: true
  end
end
