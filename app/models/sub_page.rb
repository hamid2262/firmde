class SubPage < ActiveRecord::Base
  belongs_to :page

  def to_param
    "#{id}-#{slug}"
  end
    
end
