class OrderProduct < ApplicationRecord
enum production_status: {
	 dont:       0, #着手不可
	 wait:       1, #制作待ち
	 doing:      2, #制作中
 	 complete:   3, #制作完了
}

	belongs_to :order
	belongs_to :product
end
