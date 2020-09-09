class DeliveriesController < ApplicationController
  before_action :authenticate_client!

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.where(client_id: current_client.id)
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_to deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
    if current_client.id == @delivery.client_id
      render "edit"
    else
     redirect_to deliveries_path
    end
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to deliveries_path
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  private
  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name).merge(client_id: current_client.id)
  end
end

