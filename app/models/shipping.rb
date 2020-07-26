class Shipping < ApplicationRecord
	belongs_to :member

	def destination
	self.postcode + self.address + self.name
    end
end
