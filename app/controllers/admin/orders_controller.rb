class Admin::OrdersController < ApplicationController
  def update
  end

  def index
  	@orders = Order.all
  end

  def show
  end
end
