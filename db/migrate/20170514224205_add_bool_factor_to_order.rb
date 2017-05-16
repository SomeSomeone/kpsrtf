class AddBoolFactorToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :bool_factor, :boolean
  end
end
