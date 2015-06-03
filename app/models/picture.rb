class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :img, :default_url => "/images/:style/missing.png"
  # has_attached_file :img, :styles => {thumb: "220x170>", :medium => "440x340>", :large => "660x510>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/

end
