class AddSumToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :sum, :float , default: 0
  end
end
