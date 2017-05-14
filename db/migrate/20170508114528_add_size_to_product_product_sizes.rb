class AddSizeToProductProductSizes < ActiveRecord::Migration[5.0]
  def change
    add_column :product_product_sizes, :size, :string
  end
end
