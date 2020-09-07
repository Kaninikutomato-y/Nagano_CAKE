class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  private
  def product_params
    params.require(:product).permit(:name, :explanation, :price, :image, :sale_status, :genre_id)
  end
end
