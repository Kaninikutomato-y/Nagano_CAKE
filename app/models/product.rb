class Product < ApplicationRecord
	belongs_to :genre
	has_many :order_items
	has_many :cart_items
  attachment :image

  validates :name, :price, presence: true
  validates :explanation, presence: true, length: { maximum: 50 }
  validates :sale_status, inclusion: { in: [true, false]}



  def self.search(search,word)
  	if search == "forward_match"
  		@product = Product.where("name LIKE?","#{word}%")
  	elsif search == "backward_match"
  		@product = Product.where("name LIKE?","%#{word}")
  	elsif search == "perfect_match"
  		@product = Product.where("name LIKE?","#{word}")
  	elsif search == "partial_match"
  		@product = Product.where("name LIKE?","%#{word}%")
  	else
  		@product = Product.all
  	end
  end
end
