class Client::HomeController < ApplicationController
  def top
  	@genres  =Genre.all
  	@products = Product.all
  end

  def about
  end
end
