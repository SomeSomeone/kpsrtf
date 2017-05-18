class AddBanerToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :baner, foreign_key: true
  end
end
