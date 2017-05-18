class ProductDatum < ActiveRecord::Base
  belongs_to :color
  belongs_to :product
  has_many :product_product_sizes , foreign_key: "product_datum_id"
  accepts_nested_attributes_for :product_product_sizes, reject_if: :all_blank, allow_destroy: true  
  
  has_and_belongs_to_many :photos
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  def get_price
    (price*AdminOption.find_by(key: "valuta").value.to_f).ceil
  end
  def get_promotional_price
  	(promotional_price*AdminOption.find_by(key: "valuta").value.to_f).ceil
  end
end
