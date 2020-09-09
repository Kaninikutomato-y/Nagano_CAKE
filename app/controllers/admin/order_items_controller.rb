class Admin::OrderItemsController < ApplicationController
  def update
  	@order_items = OrderItem.find(params[:id])
  	@order_items.update(order_item_params)
  	redirect_to admin_orders_path
  end

  private
  def order_item_params
  	params.require(:order_item).permit(:production_status)
  end
end
