class Order < ApplicationRecord
has_many :order_products, dependent: :destroy
belongs_to :member
enum status:{
    wait:       0, #入金待ち
    check:      1, #入金確認
    doing:      2, #製作中
    prepare:    3, #発送準備中
    complete:   4, #発送済み
  }

validates :member_id, presence: true
validates :postage, presence: true
validates :total_price, presence: true
validates :payment_method, presence: true
validates :shipping_name, presence: true
validates :shipping_postcode, presence: true
validates :shipping_address, presence: true

enum payment_method: {"クレジットカード": 0, "銀行振込": 1}
enum ooo: {"red": 0, "blue": 1, "yellow": 2}
attr_accessor :ooo

attribute :postage, default: '800'
end