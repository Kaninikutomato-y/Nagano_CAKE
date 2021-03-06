class Client::ClientsController < ApplicationController

  before_action :authenticate

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
      reset_session
      flash[:notice] = 'ご利用ありがとうございました。'
      redirect_to root_path
    end
  end

  private
    def client_params
      params.require(:client).permit(
        :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted)
    end

    def correct_client
      client = Client.find(params[:id])
      if client.id != current_client.id
        redirect_to client_path(current_client)
      end
    end
    
    def authenticate
      unless client_signed_in?
        redirect_to new_client_session_url
        flash[:notice] = "ここから先はログインが必要です!!"
      end
    end
end
