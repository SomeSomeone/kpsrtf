class AddSaleToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :sale, foreign_key: true
  end
end
