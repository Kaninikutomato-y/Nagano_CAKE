class Delivery < ApplicationRecord
	validates :name, :postcode, :address, presence: true
end
