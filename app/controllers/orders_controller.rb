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
  end

  def create
    @order.save
    redirect_to orders_complete_path

  end

  def complete
  end

end

