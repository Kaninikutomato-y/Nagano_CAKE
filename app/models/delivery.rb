class Delivery < ApplicationRecord

	validates :name, :postcode, :address, presence: true

	belongs_to :client

end
