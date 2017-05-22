class AddFieldsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :address_city, :string
    add_column :orders, :address_post_index, :string
  end
end
