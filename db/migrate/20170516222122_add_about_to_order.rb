class AddAboutToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :about, :string
  end
end
