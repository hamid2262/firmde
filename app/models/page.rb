class Page < ActiveRecord::Base
  has_attached_file :photo, :styles => { :top_image => "1920x280#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :parent_id, presence: true
  validates :slug, presence: true
  

  # def self.pages
  #   Page.order(:order)
  # end
  def children
    Page.where(parent_id: self.id)
  end

  def parent
    Page.find_by id: self.parent_id
  end

  def is_parrent?
    all_parent.includes? self
  end

  def all_parent
    page = self
    arr = [self]
    while page.parent_id != 0
      page = page.parent
      arr << page
    end
    raise
    Page.find self.parent_id
  end

  def self.roots
    where(parent_id: 0)
  end

  def ancestors
    arr=[]
    obj = self
    while obj.parent_id > 0
      arr << obj
      obj = obj.parent
    end
    arr << obj
  end
end