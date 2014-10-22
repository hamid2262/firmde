class Page < ActiveRecord::Base
  has_attached_file :photo, :styles => { :top_image => "1920x280#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
