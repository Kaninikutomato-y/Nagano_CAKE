class Product < ApplicationRecord
	belongs_to :genre
	has_many :order_items
  attachment :image
end
