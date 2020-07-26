class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :postage, :total_price, :payment_method, :shipping_name, :shipping_postcode, :shipping_address, :ooo)
  end

end
