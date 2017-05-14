class AddImgColumnsToColor < ActiveRecord::Migration[5.0]
  def up
    add_attachment :colors, :img
  end

  def down
    remove_attachment :colors, :img
  end
end
