class AddPolkasSumToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :polka_sum, :float
  end
end
