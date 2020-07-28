class HomeController < ApplicationController
  def top
  	@genres = Genre.all
  	@products = Product.find(1,2,3,4,)
  end

  def about
  end
end
