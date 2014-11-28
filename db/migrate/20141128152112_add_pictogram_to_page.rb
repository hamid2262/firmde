class AddPictogramToPage < ActiveRecord::Migration

  def self.up
    add_attachment :pages, :pictogram
  end

  def self.down
    remove_attachment :pages, :pictogram
  end

end
