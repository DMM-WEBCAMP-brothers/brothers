class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def input
    @order = Order.new
  end

  def check
    @cart_items = CartItem.all
    @products = Product.all
    @orders = Order.all
    @order = current_member.orders.new(order_params)
    case @order.ooo
      when "0" then
        @order.shipping_address = current_member.address
        @order.shipping_postcode = current_member.postcode
        @order.shipping_name = current_member.fullname
      when "1" then
        @order_information = Shipping.find_by(id: params[:shipping])
        @order.shipping_address = @order_information.name
        @order.shipping_postcode = @order_information.postcode
        @order.shipping_name = @order_information.address
      when "2" then

      end
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save
    redirect_to orders_complete_path
  end

  def complete
  end


  private

  def order_params
    params.require(:order).permit(:status, :member_id, :postage, :total_price, :shipping_name, :shipping_postcode, :shipping_address, :payment_method, :ooo, :order)
  end

  end

