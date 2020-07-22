class Genre < ApplicationRecord
	enum is_valid: { "無効": false, "有効": true }
	has_many :products
	validates :name, presence: true
end
