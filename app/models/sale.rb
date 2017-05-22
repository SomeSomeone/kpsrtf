class Sale < ApplicationRecord
  has_many :categories , dependent: :nullify
end
