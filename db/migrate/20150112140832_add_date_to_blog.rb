class AddDateToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :my_date, :datetime
    add_index :blogs, :my_date
  end
end
