class AddCityToViewStatistic < ActiveRecord::Migration
  def change
    add_column :view_statistics, :city, :string
    add_column :view_statistics, :country, :string
    add_column :view_statistics, :zip, :string
  end
end
