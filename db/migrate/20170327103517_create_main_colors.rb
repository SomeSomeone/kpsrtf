class CreateMainColors < ActiveRecord::Migration[5.0]
  def change
    create_table :main_colors do |t|
      t.string :name, null: false, default: ''
    end
  end
end
