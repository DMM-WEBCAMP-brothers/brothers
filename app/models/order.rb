class Order < ApplicationRecord
	belongs_to :member
	has_many :order_products, dependent: :destroy
	:postage = 800
	has_many :order_product, dependent: :destroy
end
