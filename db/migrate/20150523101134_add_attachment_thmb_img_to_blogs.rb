class AddAttachmentThmbImgToBlogs < ActiveRecord::Migration
  def self.up
    add_column     :blogs, :brief_txt, :text
    add_attachment :blogs, :thmb_img
  end

  def self.down
    remove_column     :blogs, :brief_txt, :text
    remove_attachment :blogs, :thmb_img
  end
end
