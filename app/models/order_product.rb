class OrderProduct < ApplicationRecord
enum production_status: {
	 dont:       0, #着手不可
	 wait:       1, #製作待ち
	 doing:      2, #製作中
 	 complete:   3, #製作完了
}
	belongs_to :order
	belongs_to :product
end
