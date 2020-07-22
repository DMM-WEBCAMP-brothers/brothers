class ProductsController < ApplicationController
  def index
    @products = Product.all
    # @products = Products.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def new
  end

  def create
    @prouduct = Product.new(product.params)
    @product.save
    redirect_to product_path(product.id)
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
