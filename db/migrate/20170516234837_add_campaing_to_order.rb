class AddCampaingToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :campaign, foreign_key: true
  end
end
