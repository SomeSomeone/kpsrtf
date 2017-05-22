class Category < ActiveRecord::Base
  belongs_to :category, class_name: "Category" 
  has_and_belongs_to_many :products
  alias_attribute :parent, :category
  belongs_to :pop
  belongs_to :baner
  belongs_to :sale
end
