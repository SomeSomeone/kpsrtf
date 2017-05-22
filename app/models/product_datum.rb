class ProductDatum < ActiveRecord::Base
  belongs_to :color
  belongs_to :product
  has_many :product_product_sizes , foreign_key: "product_datum_id"
  accepts_nested_attributes_for :product_product_sizes, reject_if: :all_blank, allow_destroy: true  
  
  has_and_belongs_to_many :photos
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  def promotional_price?
    (promotional_price!=nil and promotional_price>0) or get_sale>0
  end
  def get_price    
    (price*AdminOption.find_by(key: "valuta").value.to_f).ceil    
  end
  def get_promotional_price
    sale=get_sale
    if sale>0
      if promotional_price and promotional_price>0
        return (promotional_price*(1-sale/100)*AdminOption.find_by(key: "valuta").value.to_f).ceil
      else
        return (price*(1-sale/100)*AdminOption.find_by(key: "valuta").value.to_f).ceil  
      end
    else
      return (promotional_price*AdminOption.find_by(key: "valuta").value.to_f).ceil
    end
  end
  def get_sale
    if product
      unless product.categories.empty?        
        cats=product.categories
        cats.each{|cat|
          while cat
            if cat.sale
              return cat.sale.value
            else
              cat=cat.parent
            end
          end
        }
      end
    end
    0
  end
end
