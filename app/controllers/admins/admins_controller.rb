class Admins::AdminsController < ApplicationController
	def top
		# @orders = Order.where("created_at >= ?", DateTime.now.beginning_of_day)
		@orders = Order.where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day)
		# @orders = Order.where(id: [1,2,3,4])

	end
	private

	def admin_params
		params.require(:admin).permit(:created_at)
	end
end
