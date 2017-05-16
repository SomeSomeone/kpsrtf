class AddFieldsToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :seo_text, :text
    add_column :categories, :url, :string
    add_column :categories, :title, :string
  end
end
