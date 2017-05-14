class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :link
      t.string :name
      t.text :content
      t.integer :order

      t.timestamps null: false
    end
  end
end
