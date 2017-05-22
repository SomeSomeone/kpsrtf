class Pop < ActiveRecord::Base
	has_many :categories , dependent: :nullify
end
