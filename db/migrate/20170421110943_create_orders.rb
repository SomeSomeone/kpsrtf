class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.references :user, index: true, foreign_key: true
      t.string :status, null: false, default: 'Ожидает платежа'

      t.timestamps null: false
    end
  end
end
