class Page < ActiveRecord::Base
  extend ActsAsTree::TreeView
  extend ActsAsTree::TreeWalker

  acts_as_tree #order: "title"

  has_attached_file :photo, :styles => { :top_image => "850x200#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :parent_id, presence: true
  validate  :parent_must_not_be_itself
  # validates :slug, presence: true

  def to_params
    "#{id}-#{title}"
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

end