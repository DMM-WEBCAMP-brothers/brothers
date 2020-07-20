class Admins::ProductsController < ApplicationController
  
  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @prouduct = Product.new(product.params)
    @product.save
    redirect_to admins_product_path
  end

  def edit
  end

  def update
  end

private
  def product_params
    params.require(:product).permit(:image, :name, :explanation, :price)

  end

end