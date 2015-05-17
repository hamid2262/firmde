class AddBriefDetailsToKundens < ActiveRecord::Migration
  def change
    add_column :kundens, :brief_details, :text
    add_column :kundens, :city, :string
  end
end
