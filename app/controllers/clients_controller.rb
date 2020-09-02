class ClientsController < ApplicationController
  def show
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  private
  def client_params
    params.require(:client).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number)
  end
end
