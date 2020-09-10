class Client::ClientsController < ApplicationController

  before_action :authenticate
  def authenticate
    redirect_to new_client_session_url unless client_signed_in?
    flash[:notice] = "ここから先はログインが必要です!!"
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      render "edit"
    end
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
