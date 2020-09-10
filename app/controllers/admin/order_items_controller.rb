class Admin::OrderItemsController < ApplicationController
  def update
  	order_item = OrderItem.find(params[:id])
  	if order_item.update(order_item_params)
  		if order_item.production_status == "制作中"
  			order_item.order.update(status: 2)
  		end
  		order_items = order_item.order.order_items
  		check = 0
  		order_items.each do |order_item|
		  	if order_item.production_status == "制作完了"
				check += 1
			end
		end
		if check == order_items.length
			order_item.order.update(status: 3)
		end
  	end
  	redirect_to admin_orders_path
  end

  private
  def order_item_params
  	params.require(:order_item).permit(:production_status)
  end
end
