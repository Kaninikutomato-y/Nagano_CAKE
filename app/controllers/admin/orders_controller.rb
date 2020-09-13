class Admin::OrdersController < ApplicationController

    before_action :authenticate_admin!
    PER = 10

  def index
  	@orders = Order.page(params[:page]).per(PER)
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  end

  def update
  	@order = Order.find(params[:id])
    @order_items = @order.order_items
    if @order.update(order_params)
      if @order.status == "入金確認"
        @order_items.update(production_status: 1)
      end
    end
  	redirect_to admin_order_path(@order)
  end

  private
  def order_params
  	params.require(:order).permit(:status)
  end
end
