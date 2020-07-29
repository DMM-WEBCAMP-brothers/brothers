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
    @order = Order.find(params[:id])
    @order.status = params[:status]
    @order.update(order_params)
      if params[:order][:status] == "check"
        @order_products = @order.order_products
        @order_products.each do |f|
          OrderProduct.update(
            production_status: 1
            )
        end
      end
    redirect_to admins_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status, :member_id, :postage, :total_price, :payment_method, :shipping_name, :shipping_postcode, :shipping_address, :ooo)
  end

end
