class CreateProductProductSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :product_product_sizes  do |t|
      t.boolean :has , null: false, default: false
      t.references :product_datum, index: true, foreign_key: true , column: :product_id
      t.references :product_size, index: true, foreign_key: true
    end
  end
end
