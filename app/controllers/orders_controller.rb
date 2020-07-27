class OrdersController < ApplicationController

  def index
    @orders = Order.where(member_id: current_member.id)
    @order_products = OrderProduct.where(order_id: @orders)

  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order)
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
      @cart_items = CartItem.where(member_id: current_member.id)
    @cart_items.each do |cart_item|
      @order_product = OrderProduct.new
      @order_product.order_id = @order.id
      @order_product.product_id = cart_item.product_id
      @order_product.total_number = cart_item.total_number
      @order_product.purchase_price = cart_item.total_number * cart_item.product.price * 1.10
      @order_product.save
    end
      @cart_items.destroy_all
      redirect_to orders_complete_path
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:status, :member_id, :postage, :total_price, :shipping_name, :shipping_postcode, :shipping_address, :payment_method, :ooo, )
  end

end

