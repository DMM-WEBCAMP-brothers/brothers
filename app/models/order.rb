class Order < ApplicationRecord
has_many :order_product, dependent: :destroy
belongs_to :member
enum status:{
    wait:       0, #入金待ち
    check:      1, #入金確認
    prepare:    2, #発送準備中
    complete:   3, #発送済み
  }

validates :member_id, presence: true
validates :postage, presence: true
validates :total_price, presence: true
validates :payment_method, presence: true
validates :shipping_name, presence: true
validates :shipping_postcode, presence: true
validates :shipping_address, presence: true
enum status: {a: 0, b: 1, c: 2, d: 3}, _prefix: true

enum payment_method: { "銀行振込": 0, "クレジットカード": 1, }
enum ooo: {"red": 0, "blue": 1, "yellow": 2}
attr_accessor :ooo

end