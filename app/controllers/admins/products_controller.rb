class Admins::ProductsController < ApplicationController
  
  def index
    @new_product = Product.new
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @genres = Genre.where(is_valid: true)
    # 有効のジャンルを(特定の)全て取得したい
    # 変数名とモデルはジャンル(@genres Genre)
    # whereを使う
    # 無効と有効を管理しているカラムは[is_valid]
    # 有効の場合は[true]

  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    redirect_to admins_product_path
  end

private
  def product_params
    params.require(:product).permit(:image, :name, :explanation, :price, :is_sale, :genre_id)

  end

end