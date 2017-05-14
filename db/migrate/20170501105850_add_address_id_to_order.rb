class AddAddressIdToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :address, index: true , null: false
  end
end
