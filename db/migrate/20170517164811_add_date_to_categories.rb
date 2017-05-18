class AddDateToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :date, :timestamp
  end
end
