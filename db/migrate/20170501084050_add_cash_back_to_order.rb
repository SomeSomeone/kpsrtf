class AddCashBackToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :cash_back, :float , default: 0
  end
end
