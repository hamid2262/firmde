class TranslateSubPages < ActiveRecord::Migration
  def up
    SubPage.create_translation_table!({
      :title => :string,
      :seo_title => :string,
      :slug => :string,
      :body => :text
    }, {
      :migrate_data => true
    })
  end

  def down
    SubPage.drop_translation_table! :migrate_data => true
  end
end