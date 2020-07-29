class Admins::OrderProductsController < ApplicationController
	before_action :authenticate_admin!
	def update
		@order_product = OrderProduct.find(params[:id])
		@order_product.update(order_product_params)
		redirect_to admins_order_path(@order_product.order.id)
	end

	private
	def order_product_params
		params.require(:order_product).permit(:production_status)
	end
end
