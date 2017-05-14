class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :name , null: false, default: ''
      t.references :main_color, index: true, foreign_key: true
    end
  end
end
