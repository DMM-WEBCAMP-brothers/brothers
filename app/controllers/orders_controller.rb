class OrdersController < ApplicationController
  def index
    @orders = Order.where(member_id: current_member.id)
  end
  def show
    @order = Order.find(params[:id])
  end
  def input
    @order = Order.new
  end
  def check
    @cart_items = CartItem.where(member_id: current_member.id)
    @order = current_member.orders.new(order_params)
    case @order.ooo
    when "0" then
      @order.shipping_postcode = current_member.postcode
      @order.shipping_address = current_member.address
      @order.shipping_name = current_member.fullname
    when "1" then
      @order_information = Shipping.find_by(id: params[:shipping])
      @order.shipping_postcode = @order_information.postcode
      @order.shipping_address = @order_information.address
      @order.shipping_name = @order_information.name
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
    params.require(:order).permit(:status, :member_id, :postage, :total_price, :shipping_name, :shipping_postcode, :shipping_address, :payment_method, :ooo, )
  end
end

