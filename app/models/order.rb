class Order < ApplicationRecord

has_many :order_product, dependent: :destroy

end
