class AddReferenceImage < ActiveRecord::Migration

  def up
    add_attachment :kundens, :ref_image
  end

  def down
    remove_attachment :kundens, :ref_image
  end
  
end
