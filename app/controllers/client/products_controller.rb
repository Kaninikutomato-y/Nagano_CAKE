class Client::ProductsController < ApplicationController
  def index
  end

  def show
  	@admin.product = Product.find(params[:id])
  end
end
