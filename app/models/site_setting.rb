class SiteSetting < ActiveRecord::Base
  has_attached_file :logo, :styles => {thumb: "100x100#", :medium => "260x195#", :large => "850x260#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  has_attached_file :favicon
  validates_attachment_content_type :favicon, :content_type => /\Aimage\/.*\Z/

end
