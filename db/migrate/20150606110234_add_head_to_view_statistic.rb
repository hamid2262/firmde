class AddHeadToViewStatistic < ActiveRecord::Migration
  def change
    add_column :view_statistics, :head, :text
  end
end
