class Client::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  end


  private
  def product_params
    params.require(:product).permit(:name, :explanation, :price, :image, :sale_status, :genre_id)
  end
end


