class OrdersController < ApplicationController

  def index
    @orders =　Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def input
    @order = Order.new
  end

  def check
    @cart_items = CartItem.where(member_id: current_member.id)
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    if @order.ooo == "a"
      @order.shipping_name = current_member.last_name + current_member.first_name
      @order.shipping_postcode = current_member.postcode
      @order.shipping_address = current_member.address
    elsif @order.ooo == "b"

    elsif @order.ooo == "c"

    end
    @order.save(order_params)
    @cart_items = CartItem.where(member_id: current_member.id)
    redirect_to orders_check_path
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :postage, :total_price, :payment_method, :shipping_name, :shipping_postcode, :shipping_address, :ooo)
  end

end

