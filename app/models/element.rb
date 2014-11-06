class Element < ActiveRecord::Base

  has_attached_file :photo, :styles => { :bg => "1920x445>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  belongs_to :slideshow

end
