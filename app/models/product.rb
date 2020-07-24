class Product < ApplicationRecord

	attachment :image
	has_many :cart_items, dependent: :destroy
	belongs_to :genre
	validates :name, presence: true
	validates :image, presence: true
	validates :explanation, presence: true
	validates :price, presence: true

	def is_sale_text
		if is_sale == true
			"販売中"
		else
			"売り切れ"
		end
	end

end
