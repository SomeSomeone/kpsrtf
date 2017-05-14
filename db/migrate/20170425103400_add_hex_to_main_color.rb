class AddHexToMainColor < ActiveRecord::Migration[5.0]
  def change
  	add_column :main_colors, :hex, :string, null: false, default: '#000'
  end
end
