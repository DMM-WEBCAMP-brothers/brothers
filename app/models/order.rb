class Order < ApplicationRecord


validates :member_id, presence: true
validates :postage, presence: true
validates :total_price, presence: true
validates :payment_method, presence: true
validates :shipping_name, presence: true
validates :shipping_postcode, presence: true
validates :shipping_address, presence: true

has_many :order_product, dependent: :destroy
belongs_to :member
enum status: {a: 0, b: 1, c: 2, d: 3}, _prefix: true

enum payment_method: {"クレジットカード": 0, "銀行振込": 1}
enum ooo: {"red": 0, "blue": 1, "yellow": 2}
attr_accessor :ooo

end

