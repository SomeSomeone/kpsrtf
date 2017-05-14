class RemoveAboutAndPriceToProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :price, :string
    remove_column :products, :about, :string
  end
end
