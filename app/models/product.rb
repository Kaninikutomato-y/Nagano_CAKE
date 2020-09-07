class Product < ApplicationRecord
	belongs_to :genre
	has_many :order_items
  attachment :image

  def self.search(search, word)
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