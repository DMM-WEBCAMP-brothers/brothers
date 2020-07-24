class OrdersController < ApplicationController
  def index
    @orders =　Order.all
  end
  def show
    @order = Order.find(params[:id])
  end
  def input
  end
  def check
    @cart_items = CartItem.all
    @products = Product.all
  end
  def create
    @order.save
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end
  def complete
  end
end