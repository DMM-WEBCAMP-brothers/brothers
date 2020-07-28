class Admins::OrderProductsController < ApplicationController
	def update
		@order_product = OrderProduct.find(params[:id])
		@order_product.production_status = params[:production_status]
		@order_product.update
		redirect_to admins_order_path(@order_product.order)
	end

	# private
	# def order_product_params
	# 	params.require(:order_product).permit(:production_status)
	# end
end
