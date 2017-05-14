class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address,null: false, default: ""
      t.references :user, index: true, foreign_key: true,null: false

      t.timestamps null: false
    end
  end
end
