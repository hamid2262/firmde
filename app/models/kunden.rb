class Kunden < ActiveRecord::Base

  after_save :clear_cache

  has_attached_file :photo, :styles => { :thumb => "159x101>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


  has_attached_file :photo_gray, :styles => { :thumb => "159x101>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo_gray, :content_type => /\Aimage\/.*\Z/  

  has_attached_file :ref_image, :styles => { :thumb => "180x180!" }, :default_url => "/images/kundens/ref_image/:style/missing.jpg"
  validates_attachment_content_type :ref_image, :content_type => /\Aimage\/.*\Z/  

  def clear_cache
    Rails.cache.clear
  end
end
