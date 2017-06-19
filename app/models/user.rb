class User < ActiveRecord::Base
	has_one :profile
	has_many :stores

	def self.products
		products = []
		stores.each do |store|
			temp = store.products
			temp.each do |p|
				products << p
			end
		end
		return products
	end
end
