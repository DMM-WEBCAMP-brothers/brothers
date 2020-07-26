class Order < ApplicationRecord

has_many :order_product, dependent: :destroy
belongs_to :member
enum payment_method: {'クレジットカード': 0, '銀行振込': 1 }
enum ooo: { red: 0, blue: 1, yellow: 2}
attr_accessor :ooo
end

