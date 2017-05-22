class AddOrderToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :order, foreign_key: true
  end
end
