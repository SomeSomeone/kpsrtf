class RemoveDatasFromAddress < ActiveRecord::Migration[5.0]
  def change
  	remove_column :addresses, :seccond_address
  	remove_column :addresses, :address
  end
end
