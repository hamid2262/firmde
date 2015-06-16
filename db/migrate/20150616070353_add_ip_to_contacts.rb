class AddIpToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :ip, :string
  end
end
