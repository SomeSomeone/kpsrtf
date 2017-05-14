class AddPolkaUrlToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :polka_url, :string
  end
end
