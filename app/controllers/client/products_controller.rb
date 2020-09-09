class Client::ProductsController < ApplicationController
  def index
    @products = Product.joins(:genre).where(genres: {valid_flag: true})
    @genres = Genre.all
  end

  def show
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
    @genres = Genre.all
  end

  def search
    @genre = Genre.find(params[:id])
    @products = @genre.products.order("created_at DESC").reverse_order
  end
end