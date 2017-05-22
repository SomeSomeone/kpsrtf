class AddUpdateToProductProductSize < ActiveRecord::Migration[5.0]
  def change
    add_column :product_product_sizes, :update_at, :datetime
  end
end
