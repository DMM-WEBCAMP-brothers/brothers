class ProductsController < ApplicationController
  before_action :authenticate_member!, only: [:show]
  def index
    @genres = Genre.all
    if params[:genre_id]
    @products = Product.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
    else
    @products = Product.all.page(params[:page]).per(8)
    end
  end

  def show
    @genres = Genre.all
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