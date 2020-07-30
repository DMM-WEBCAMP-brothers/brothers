class CartItem < ApplicationRecord

  validates :total_number, presence: true
  belongs_to :product
  belongs_to :member
  def destination
  	self.postcode + self.address + self.name
  end
  # has_one :member

  # def total_price

  # 	total_number * price

  # end
end