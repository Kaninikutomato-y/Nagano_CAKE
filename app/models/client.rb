class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy


  def self.search(search,word)
  	if search == "forward_match"
  		@client = Client.where("last_name LIKE?",word + '%')
  	elsif search == "backward_match"
    	@client = Client.where("first_name LIKE?",'%' + word)
    elsif search == "perfect_match"
      clientlist = []
      Client.all.each do |client|
        fullname = client.last_name + client.first_name
        if fullname == word
          clientlist.push client.id
        end
      end
      @client = Client.find(clientlist)
    elsif search == "partial_match"
    	@client = Client.where("last_name LIKE?",'%' + word + '%').or(Client.where("first_name LIKE?",'%' + word + '%'))
    else
    	@client = Client.all
    end
  end
end