class Page < ActiveRecord::Base
  extend ActsAsTree::TreeView
  extend ActsAsTree::TreeWalker

  has_many :page_backups
  has_many :sub_pages
  
  acts_as_tree #order: "title"

  has_attached_file :photo, :styles => { :top_image => "850x230#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_attached_file :pictogram, :styles => { :thumb => "24x24>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pictogram, :content_type => /\Aimage\/.*\Z/

  has_attached_file :pictogram_hover, :styles => { :thumb => "24x24>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pictogram_hover, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :parent_id, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validate  :parent_must_not_be_itself
  
  def to_param
    "#{id}-#{slug}"
  end
  
  def visible_pages
    self.self_and_siblings.concat(self.ancestors) + self.children
  end

  def self.page_tree
    arr = [] 
    Page.walk_tree do |page, level| 
      arr << ["#{'-'*level}#{page.title}", page.id] 
    end  
    arr    
  end

  def order_self_or_default
    order || 10
    raise
  end

  def depth
    d = 0
    page = self
    while page.parent
      page = page.parent
      d +=1
    end
    d
  end

  def self.services
    Page.find_by(title: "Services")
  end

  def parent_must_not_be_itself
    if self.id == self.parent_id
      errors.add(:parent_id, "parent page can not be itself")
    end
  end

  def self.sidebar(r)
    r.children.where(visible_on_sidebar: true).order(:order)
  end

  def self.navbar(r)
    r.children.where(visible_on_navbar: true).order(:order)
  end

  def self.loesungen
    Page.find_by(title: "Lösungen")
  end

  def photo_of_self_or_parent
    obj =  self
    while obj && !obj.photo.exists?
      obj = obj.parent
    end
    obj ? obj.photo.url(:top_image) : self.photo.url(:top_image)
  end

end