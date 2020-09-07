class Genre < ApplicationRecord
	has_many :products
 　 validates :name, presence: true
end

