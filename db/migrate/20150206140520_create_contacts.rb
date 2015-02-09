class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :tel
      t.string :address
      t.text :message

      t.timestamps
    end
  end
end
