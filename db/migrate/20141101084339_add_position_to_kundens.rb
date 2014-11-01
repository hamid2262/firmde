class AddPositionToKundens < ActiveRecord::Migration
  def change
    add_column :kundens, :position, :integer
  end
end
