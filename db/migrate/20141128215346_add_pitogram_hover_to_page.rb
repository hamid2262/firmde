class AddPitogramHoverToPage < ActiveRecord::Migration

  def self.up
    add_attachment :pages, :pictogram_hover
  end

  def self.down
    remove_attachment :pages, :pictogram_hover
  end


end
