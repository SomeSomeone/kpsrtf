class CreateFooterSections < ActiveRecord::Migration[5.0]
  def change
    create_table :footer_sections do |t|
      t.integer :order
      t.text :text
      t.boolean :see_all
      t.boolean :visible
    end
  end
end
