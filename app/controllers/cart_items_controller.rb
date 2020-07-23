class CartItemsController < ApplicationController
	def index
		@cart_items = CartItem.all

	def create
		@cart_item = CartItem.new(cart_items_params)
		@cart_item.member_id = current_member.id
		@cart_item.product_id = params[:product_id]
    	@cart_item.save
    	redirect_to cart_items_path
	end

	def update
	      @cart_item = CartItem.find(params[:id])
	      @cart_item.update(cart_items_params)
	   	  redirect_to cart_items_path
	end

	def destroy
		cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
	end

	def destroy_all
	   @cart_items = current_cart
       @cart_items.destroy
       session[:cart_items_id] = nil
       respond_to do |format|
       format.html { redirect_to cart_items_path, notice: 'カートが空になりました。' }
       format.json { head :no_content }
    end
	end

	private
	def cart_items_params
		params.require(:cart_item).permit(:total_number, :product_id, :member_id)
	end
end
