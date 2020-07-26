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
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    if @order.ooo == "a"
       @order.shipping_name = current_member.last_name + current_member.first_name
       @order.shipping_postcode = current_member.postcode
       @order.shipping_address = current_member.address

    elsif @order.ooo == "b"
       @order_information = Shipping.find(params[:order][:shipping_id].to_i)
       @order.shipping_name = @order_information.name
       @order.shipping_postcode = @order_information.postcode
       @order.shipping_address = @order_information.address

    else @order.ooo == "c"

    end
      @order.save
      @cart_items = CartItem.all
      @cart_items.destroy_all
      redirect_to orders_check_path
  end

  def complete
  end


  private
  def order_params
    params.require(:order).permit(:status, :member_id, :postage, :totall_price, :shipping_name, :shipping_postcode, :shipping_adress, :payment_method, :ooo)
  end
end

