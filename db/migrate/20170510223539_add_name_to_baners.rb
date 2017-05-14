class AddNameToBaners < ActiveRecord::Migration[5.0]
  def change
    add_column :baners, :name, :string
  end
end
