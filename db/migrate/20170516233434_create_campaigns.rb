class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :code
      t.float :value
      t.integer :number
      t.boolean :inf_number
      t.datetime :period
      t.boolean :inf_period

      t.timestamps
    end
  end
end
