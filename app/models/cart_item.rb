class CartItem < ApplicationRecord
	belongs_to :product, optional:true
	belongs_to :member
end
