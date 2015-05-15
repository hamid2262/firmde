class AddBriefDetailsToKundens < ActiveRecord::Migration
  def change
    add_column :kundens, :brief_details, :string
    add_column :kundens, :city, :string
  end
end
