class AddNameToPops < ActiveRecord::Migration[5.0]
  def change
    add_column :pops, :name, :string
  end
end
