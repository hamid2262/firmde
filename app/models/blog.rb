class Blog < ActiveRecord::Base
  has_attached_file :photo, :styles => {thumb: "100x100#", :medium => "260x195#", :large => "850x260#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_attached_file :thmb_img, :styles => {thumb: "100x100#",  :medium => "260x195#", :large => "850x260#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :thmb_img, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true  
  validates :brief_txt, presence: true, length: {maximum: 400}
  
  
  def to_param
    "#{id}-#{slug.gsub " ", "-"}"
  end

  def self.filter_category(category)
    category.present? ? where( "category LIKE ?", "%#{category}%").order("my_date desc") : where(nil).order("my_date desc")
  end

  def self.category_count
    Blog.group(:category).count
  end

  def self.footer_last_blogs
    Rails.cache.fetch([:blogs, :footer_last_blogs], expires_in: 2.minutes) do 
      Blog.order("my_date desc").limit(2)
    end
  end
  
  def display_date
     # self.my_date ? self.my_date.strftime("%d/%m/%Y") : self.created_at.strftime("%d/%m/%Y")
     self.my_date ? self.my_date.strftime("%d/%m/%Y") : "dd/mm/yyyy"
  end

  def thumbnail_image
    self.thmb_img.exists? ? self.thmb_img.url(:thumb) : self.photo.url(:thumb)
  end

  def medium_image
    self.thmb_img.exists? ? self.thmb_img.url(:medium) : self.photo.url(:medium)
  end

end
