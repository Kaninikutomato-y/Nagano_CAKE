class Delivery < ApplicationRecord

	belongs_to :client
	validates :name, :postcode, :address, presence: true

	def postcode_address_name
		self.postcode +  " " + self.address + " " + self.name
	end
end
