class Admins::OrderProductsController < ApplicationController
	before_action :authenticate_admin!
	def update
		@order_product = OrderProduct.find(params[:id])
		@order = @order_product.order
		@order_product.update(order_product_params)
    
		if params[:order_product][:production_status] == "doing"
			Order.update(
				status: 2
				)
		end

		if params[:order_product][:production_status] == "complete"
			if OrderProduct.where(production_status: 3).count == @order.order_products.count
			Order.update(
				status: 3
				)
			end
		end
		redirect_to admins_order_path(@order_product.order.id)
	end

	private
	def order_product_params
		params.require(:order_product).permit(:production_status, :order_id)
	end
end
