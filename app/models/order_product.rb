class OrderProduct < ApplicationRecord
enum production_status: {
	 prepare:    0, #制作準備中
	 doing:      1, #制作途中
 	 complete:   2, #制作完了
}
	belongs_to :order
	belongs_to :product
end
