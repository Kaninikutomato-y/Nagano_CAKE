class Delivery < ApplicationRecord

	belongs_to :client
	validates :name, :postcode, :address, presence: true
	validates :postcode, length: {is:7}

	def postcode_address_name
		self.postcode +  " " + self.address + " " + self.name
	end
end
