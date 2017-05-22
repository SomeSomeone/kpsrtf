class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.float :value
      t.date :term

      t.timestamps
    end
  end
end
