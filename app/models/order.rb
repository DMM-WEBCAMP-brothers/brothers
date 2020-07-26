class Order < ApplicationRecord

has_many :order_products, dependent: :destroy
belongs_to :member

enum payment_method: { 'クレジットカード': 0, '銀行振込': 1}
attr_accessor :ooo
enum ooo: { self: 0, nozawa: 1, new_address: 2}
end
