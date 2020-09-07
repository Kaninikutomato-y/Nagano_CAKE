class DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_to deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
  end

  private
  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name).merge(client_id: current_client.id)
  end
end

