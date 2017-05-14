class AddAboutToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :about, :text
  end
end
