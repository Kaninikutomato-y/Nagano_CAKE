class Client::ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to client_path(@client)
  end

  def unsubscribe
    @client = Client.find(params[:id])
    if request.patch?
      @client.update(is_deleted: true)
      redirect_to root_path
    end
  end

  private
    def client_params
      params.require(:client).permit(
        :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted)
    end
end
