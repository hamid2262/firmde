class Kunden < ActiveRecord::Base


  has_attached_file :photo, :styles => { :thumb => "159x101>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


  has_attached_file :photo_gray, :styles => { :thumb => "159x101>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo_gray, :content_type => /\Aimage\/.*\Z/  
end
