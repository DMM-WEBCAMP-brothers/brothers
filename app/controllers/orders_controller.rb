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
    @cart_items = CartItem.all
    @products = Product.all
  end
  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    if @order.ooo == "a"
       @order.shipping_name = current_member.last_name + current_member.first_name
       @order.shipping_postcode = current_member.postcode
       @order.shipping_address = current_member.address
    elsif @order.ooo == "b"
       @order.shipping_name = shipping.name
       @order.shipping_postcode = shipping.postcode
       @order.shipping_address = shipping.address
    else @order.ooo == "c"
       @order.shipping_name = current_member.last_name + current_member.first_name
       @order.shipping_postcode = current_member.postcode
       @order.shipping_address = current_member.address
    end
      @order.save
      @cart_items = CartItem.all
      @cart_items.destroy_all
      redirect_to orders_complete_path
    end
    def complete
    end
    private
    def order_params
    params.require(:order).permit(:status, :member_id, :postage, :totall_price, :shipping_name, :shipping_postcode, :shipping_adress, :payment_method, :ooo)
    end
   end