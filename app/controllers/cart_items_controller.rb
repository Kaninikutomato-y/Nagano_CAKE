class CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
    @cart_item = @cart_items.new(product_id: params[:product_id])
  end

  # def create
  #   @cart_item = @cart_items.build(product_id: params[:product_id]) if @cart_item.blank?
  #   @cart_item.quantity += params[:quantity].to_i
  #   if @cart_item.save
  #     redirect_to cart_items_path(@cart_item)
  #   else
  #   end
  #  def add_item
  #   if @cart_item.blank?
  #      @cart_item = current_cart_items.build(:product_id: patams[:product_id])
  #   end
  #   @cart_item.quantity += params[:quantity].to_i
  #   @cart_item.save
  #   redirect_to current_cart_item
  # end

  # def update_item
  #   @cart_item.update(quantity: params[:quantity].to_i)
  #   redirect_to current_cart_item
  # end


  def create
    @cart_item = current_client.cart_items.build(cart_item_params)
    @current_cart_item = CartItem.find_by(product_id: @cart_item.product_id,client_id: @cart_item.client_id)
      if @current_cart_item.nil?
      if @cart_item.save
        flash[:success] = 'カートに商品が追加されました！'
        redirect_to cart_items_path
      else
        @carts_items = @customer.cart_items.all
        render 'index'
        flash[:danger] = 'カートに商品を追加できませんでした。'
      end
    else
      @current_item.quantity += params[:quantity].to_i
      @current_item.update(cart_item_params)
      redirect_to cart_items_path
    end
  end


  def update
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart_item
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
