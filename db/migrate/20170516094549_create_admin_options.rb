class CreateAdminOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_options do |t|
      t.string :key
      t.string :value
    end
  end
end
