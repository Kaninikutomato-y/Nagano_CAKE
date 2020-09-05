class CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all

  end

  def create
    
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :client_id, :quantity)
  end

end
