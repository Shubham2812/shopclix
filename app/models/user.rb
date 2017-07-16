class User < ActiveRecord::Base
	has_one :profile
	has_many :stores
	has_many :carts

	# after_create :send_confirmation_mail

    def send_welcome_mail
      UserMailer.welcome_email(self).deliver_now
    end

	def products
		products = []
		stores.each do |store|
			temp = store.products
			temp.each do |p|
				products << p
			end
		end
		return products
	end

	def cart
		items = []
		carts.each do |cart|
			product = Product.find(cart.product_id)
			items << product
		end
		return items
	end

	def send_confirmation_mail
		otp = generate_otp
	end
end
