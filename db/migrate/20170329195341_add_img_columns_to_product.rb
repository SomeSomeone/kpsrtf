class AddImgColumnsToProduct < ActiveRecord::Migration[5.0]
  def up
    add_attachment :products, :img
    add_attachment :products, :img_alt
  end

  def down
    remove_attachment :products, :img
    remove_attachment :products, :img_alt
  end
end
