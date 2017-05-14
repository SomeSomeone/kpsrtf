class AddMoreToProductData < ActiveRecord::Migration[5.0]
  def change
    add_column :product_data, :more, :string, null: false, default: ''
  end
end
