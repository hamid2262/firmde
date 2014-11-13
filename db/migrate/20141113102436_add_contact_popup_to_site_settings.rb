class AddContactPopupToSiteSettings < ActiveRecord::Migration
  def change
    add_column :site_settings, :contact_form_text, :text
  end
end
