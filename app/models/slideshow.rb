class Slideshow < ActiveRecord::Base

  has_attached_file :background, :styles => { :bg => "1920x445>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :background, :content_type => /\Aimage\/.*\Z/

  has_many :elements

  validates :name, presence: true
  
end
