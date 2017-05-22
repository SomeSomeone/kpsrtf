class Product < ActiveRecord::Base
	has_attached_file :img, styles: { original: "444x666>"  , thumbnail: "150x150>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
	has_attached_file :img_alt, styles: { original: "444x666>" , thumbnail: "150x150>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
    has_many :product_datum, dependent: :delete_all
    accepts_nested_attributes_for :product_datum, reject_if: :all_blank, allow_destroy: true
    has_many :color, through: :product_datum
    has_and_belongs_to_many :photos
    has_and_belongs_to_many :categories
    accepts_nested_attributes_for :categories

    def get_pop
      unless categories.empty?        
        cats=categories
        cats.each{|cat|
          while cat
            if cat.pop
              return cat.pop.text
            else
              cat=cat.parent
            end
          end
        }
      end
    false
  end

end



