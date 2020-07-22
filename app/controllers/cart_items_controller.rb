class CartItemsController < ApplicationController
	def index
		@cart_items = Cart_item.all
	end

	def create
	end

	def update

	end

	def destroy
		cart_item = Cart_item.find(params[:id])
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
end
