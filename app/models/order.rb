class Order < ApplicationRecord
	belongs_to :member
	has_many :order_products, dependent: :destroy
	has_many :order_product, dependent: :destroy
	enum payment_method: { "クレジットカード": false, "銀行振込": true }
	attr_accessor :ooo
end
