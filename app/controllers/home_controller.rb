class HomeController < ApplicationController
  def top
  	@genres = Genre.all
  	@products = Product.find(19,17,20,22)
  end

  def about
  end
end
