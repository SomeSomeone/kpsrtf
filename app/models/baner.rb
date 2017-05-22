class Baner < ActiveRecord::Base
  belongs_to :photo
  has_many :categories , dependent: :nullify
end
