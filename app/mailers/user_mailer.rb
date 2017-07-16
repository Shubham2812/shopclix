class UserMailer < ApplicationMailer

  	def confirmation_email otp, name, email
  		@name = name
  		@otp = otp
  		@email = email
    	mail(to: email, subject: 'Confirmation of Email')
  	end

  	def welcome_email user
		byebug
    	@user = user
   	 	@url  = 'localhost:3000/signin'
    	mail(to: @user.email, subject: 'Welcome to Shopclix')
  	end

end
