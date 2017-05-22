class AddNameToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :name, :string
  end
end
