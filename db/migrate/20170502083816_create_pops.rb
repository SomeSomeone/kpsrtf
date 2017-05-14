class CreatePops < ActiveRecord::Migration[5.0]
  def change
    create_table :pops do |t|
      t.text :text
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
