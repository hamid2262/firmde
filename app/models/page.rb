class Page < ActiveRecord::Base
  extend ActsAsTree::TreeView
  extend ActsAsTree::TreeWalker

  acts_as_tree #order: "title"

  has_attached_file :photo, :styles => { :top_image => "1920x280#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  # validates :parent_id, presence: true
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

end