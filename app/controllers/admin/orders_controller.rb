class Admin::OrdersController < ApplicationController

  def index
  	@orders = Order.all
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
  	redirect_to admin_orders_path
  end

  private
  def order_params
  	params.require(:order).permit(:status)
  end
end
