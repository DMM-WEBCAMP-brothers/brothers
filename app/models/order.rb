class Order < ApplicationRecord
	belongs_to :member
	has_many :order_product, dependent: :destroy
	attr_accessor :ooo
end
