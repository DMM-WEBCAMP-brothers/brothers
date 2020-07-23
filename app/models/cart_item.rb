class CartItem < ApplicationRecord


  belongs_to :product
  belongs_to :member
  # has_one :member

  # def total_price

  # 	total_number * price

  # end
	belongs_to :member
	belongs_to :product

