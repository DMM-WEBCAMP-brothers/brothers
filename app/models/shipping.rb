class Shipping < ApplicationRecord
	belongs_to :member
	validates :postcode, presence: true
	validates :name, presence: true
	validates :address, presence: true
	def destination
		self.postcode + self.address + self.name
	end
end
