class Admin::ClientsController < ApplicationController

    before_action :authenticate_admin!

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to admin_client_path(@client)
    else
      render "edit"
    end
  end

  def index
    @clients = Client.all
  end

  private
    def client_params
      params.require(:client).permit(
        :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted)
    end
end
