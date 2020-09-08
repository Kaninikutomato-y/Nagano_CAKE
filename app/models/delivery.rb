class Delivery < ApplicationRecord

	validates :name, :postcode, :address, presence: true

	belongs_to :client

	def postcode_address_name
		self.postcode +  " " + self.address + " " + self.name
	end
end
