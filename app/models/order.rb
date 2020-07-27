class Order < ApplicationRecord
has_many :order_product, dependent: :destroy
belongs_to :member
enum payment_method: { "銀行振り込み": false, "クレジットカード": true }
enum status:{
    wait:       0, #入金待ち
    check:      1, #入金確認
    prepare:    2, #発送準備中
    complete:   3, #発送済み
  }

attr_accessor :ooo
end