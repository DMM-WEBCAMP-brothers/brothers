class Product < ApplicationRecord

	attachment :image
	belongs_to :genre
	has_many :cart_items

	validates :name, presence: true
	validates :image, presence: true
	validates :explanation, presence: true
	# validates :is_sale, presence: true

	def is_sale_text
		if is_sale == true
			"販売中"
		else
			"売り切れ"
		end
	end

end
