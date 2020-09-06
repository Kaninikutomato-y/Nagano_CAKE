class Client::OrdersController < ApplicationController
  #before_action :authenticate_client!
  before_action :set_client

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
        @order.name = "#{client.last_name} #{client.first_name}"
      when 2
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
  end

  def confirm
  end

  def thanks
  end

  def index
    @orders = @client.orders
  end

  def show
  end

  private

  def set_client
    @client = current_client
  end

  def order_params
    params.require(:order).permit(
      :created_at, :address, :name, :status, :pay_method, :postcode, :freight,)

end
