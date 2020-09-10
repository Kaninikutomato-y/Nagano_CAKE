class Client::ProductsController < ApplicationController

  before_action :correct_product, only: [:show]
  before_action :correct_genre, only: [:search]

  def index
    @products = Product.joins(:genre).where(genres: {valid_flag: true})
    @genres = Genre.all
  end

  def show
  	@cart_item = CartItem.new
    @genres = Genre.all
  end

  def search
    @products = @genre.products
  end

  private
  def correct_product
    @product = Product.find(params[:id])
    if @product.genre.valid_flag == false
      redirect_to products_path
    end
  end

  def correct_genre
    @genre = Genre.find(params[:id])
    if @genre.valid_flag == false
      redirect_to products_path
    end
  end

end