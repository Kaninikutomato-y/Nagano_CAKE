class Client::OrdersController < ApplicationController

  before_action :set_client
  before_action :authenticate

  def new
    @order = Order.new
  end

  def create
    if current_client.cart_items.exists?
      @order = Order.new(order_params)
      @order.client_id = current_client.id
      @add = params[:order][:add].to_i
      case @add
        when 1
          @order.postcode = @client.postcode
          @order.address = @client.address
          @order.name = "#{@client.last_name} #{@client.first_name}"
        when 2
          @order.postcode = params[:order][:postcode]
          @order.address = params[:order][:address]
          @order.name = params[:order][:name]
        when 3
          @order.postcode = params[:order][:postcode]
          @order.address = params[:order][:address]
          @order.name = params[:order][:name]
      end
      @order.save

      if Order.find_by(address: @order.address).nil?
        @delivery = Delivery.new
        @delivery.postcode = @order.postcode
        @delivery.address = @order.address
        @delivery.name = @order.name
        @delivery.client_id = current_client.id
        @delivery.save
      end

      current_client.cart_items.each do |cart_item|
        order_item = @order.order_items.build
        order_item.order_id = @order.id
        order_item.product_id = cart_item.product_id
        order_item.quantity = cart_item.quantity
        order_item.price = cart_item.product.price
        order_item.save
        cart_item.destroy
      end
      render :thanks
    else
      flash[:notice] = "カートが空です！"
      redirect_to root_path
    end
  end

  def confirm
    @order = Order.new
    @cart_items = current_client.cart_items
    @order.pay_method = params[:order][:pay_method]
    @order.billed_amount = params[:order][:billed_amount]
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.postcode = @client.postcode
        @order.address = @client.address
        @order.name = "#{@client.last_name} #{@client.first_name}"
      when 2
        @address = params[:order][:address].to_i
        @delivery = Delivery.find(@address)
        @order.postcode = @delivery.postcode
        @order.address = @delivery.address
        @order.name = @delivery.name
      when 3
        @order.postcode = params[:order][:new_add][:postcode]
        @order.address = params[:order][:new_add][:address]
        @order.name = params[:order][:new_add][:name]
    end
  end

  def thanks
  end

  def index
    @orders = @client.orders.order(id: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    if @order.client_id != current_client.id
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_client
    @client = current_client
  end

  def order_params
    params.require(:order).permit(
      :address, :name, :status, :pay_method, :postcode, :freight, :billed_amount,
      order_items_attributes: [:order_id, :product_id, :quantity, :price, :production_status]
      )
  end

  def authenticate
    unless client_signed_in?
      redirect_to new_client_session_url
      flash[:notice] = "ここから先はログインが必要です!!"
    end
  end
end
