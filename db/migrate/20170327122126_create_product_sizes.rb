class CreateProductSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :product_sizes do |t|
      t.references :category, index: true, foreign_key: true
      t.string :size , null: false, default: ''
    end
  end
end
