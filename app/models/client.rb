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
  		@client = Client.where("last_name LIKE?","#{word}%")
  	elsif search == "backward_match"
    	@client = Client.where("last_name LIKE?","%#{word}")
    elsif search == "perfect_match"
    	@client = Client.where("last_name LIKE?","#{word}")
    elsif search == "partial_match"
    	@client = Client.where("last_name LIKE?","%#{word}%")
    else
    	@client = Client.all
    end
  end
end
