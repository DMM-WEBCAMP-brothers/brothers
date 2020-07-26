class Order < ApplicationRecord

has_many :order_product, dependent: :destroy
belongs_to :member
enum payment_method: { "銀行振り込み": false, "クレジットカード": true }
attr_accessor :ooo

