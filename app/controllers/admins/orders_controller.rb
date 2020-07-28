class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order)
  end

  def input
  end

  def check
  end

  def create
  end

  def complete
  end

  def update
    @order_products = Order.find(params[:id])
    @order_products.update(order_params)
    redirect_to admins_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :postage, :total_price, :payment_method, :shipping_name, :shipping_postcode, :shipping_address, :ooo, :status)
  end

end
