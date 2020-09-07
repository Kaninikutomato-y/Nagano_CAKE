class Client::ProductsController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @genre = Genre.find(params[:id])
    @products = @genre.products.order("created_at DESC").reverse_order
  end

  private
  def product_params
    params.require(:product).permit(:name, :explanation, :price, :image, :sale_status, :genre_id)
  end
end
