class AddOrderToSlideshows < ActiveRecord::Migration
  def change
    add_column :slideshows, :name, :string
    add_column :slideshows, :order, :integer
    add_index  :slideshows, :order
  end
end
