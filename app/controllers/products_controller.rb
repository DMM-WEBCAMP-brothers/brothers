class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new

  end

  def new
  end

  def edit
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  private
  def product_params
      params.require(:product).permit(:name, :price, :image, :explanation, )

  end
end