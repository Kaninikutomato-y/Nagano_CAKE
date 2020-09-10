class CartItemsController < ApplicationController


  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.client_id = current_client.id
    @current_item = CartItem.find_by(product_id: @cart_item.product_id, client_id: current_client.id)
    if @current_item.nil?
      if @cart_item.save
        redirect_to cart_items_path
      else
        @cart_items = CartItem.all
        render 'index'
      end
    else
      @current_item.quantity += @cart_item.quantity
      @current_item.save
      redirect_to cart_items_path
    end
  end


  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    if current_client.cart_items.destroy_all
      flash[:notice] = 'カートを空にしました。'
      redirect_to cart_items_path
    end
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

end
