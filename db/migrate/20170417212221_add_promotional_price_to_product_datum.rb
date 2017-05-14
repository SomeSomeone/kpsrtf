class AddPromotionalPriceToProductDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :product_data, :promotional_price, :float
  end
end
