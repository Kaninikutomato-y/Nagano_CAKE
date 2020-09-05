class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to prudct_path(@product)
    end
  end

  def edit
  end

  def update
  end

  def show

  end

  def index
  end
end
