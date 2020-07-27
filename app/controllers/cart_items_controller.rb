class CartItemsController < ApplicationController
	def index
		@cart_item = CartItem.new
		@products = Product.all
		@cart_items = CartItem.where(member_id: current_member.id)
	end

	def create
		@cart_items = CartItem.where(member_id: current_member.id)
		if @cart_items.find_by(product_id: params[:product_id]).present?
			@cart_items.each do |cart_item|
				if cart_item == @cart_items.find_by(product_id: params[:product_id])
					sum = cart_item.total_number.to_i + cart_items_params[:total_number].to_i
					cart_item.update_attributes(total_number: sum)
					redirect_to cart_items_path
				end
			end
		else
			@cart_item = CartItem.new(cart_items_params)
			@cart_item.member_id = current_member.id
			@cart_item.product_id = params[:product_id]
    		@cart_item.save
    		redirect_to cart_items_path
		end
	end

	def update
    	@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_items_params)
		redirect_to cart_items_path
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        flash[:notice] = "カートを空にしました！"
        redirect_to cart_items_path
	end
	def destroy_all
		@cart_items = CartItem.where(member_id: current_member.id)
  		@cart_items.destroy_all
  		redirect_to cart_items_path
	end
	private
	def cart_items_params
		params.require(:cart_item).permit(:total_number, :product_id, :member_id)
	end
end