class SubPage < ActiveRecord::Base

  # translates :title, :seo_title, :slug, :body 
  belongs_to :page

  def to_param
    "#{id}-#{slug}"
  end
    
end
