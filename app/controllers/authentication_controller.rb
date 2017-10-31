class AuthenticationController < ApplicationController

	def signup
	end

	def confirm_email
		byebug
		if params[:role] == "seller"
			seller = User.find_by(email: params[:email], role: 'seller')
			if not seller
				seller = User.new
				seller.name = params[:name]
				seller.email = params[:email]
				seller.password = params[:password]
				seller.phone = params[:phone]
				seller.role = 'seller'
				seller.save
				# flash[:notice] = "Signup Successful"
				# session[:user_id] = seller.id
				# session[:role] = seller.role.to_s
				# return redirect_to '/'
				@user_id = seller.id
				otp = rand(9000) + 1000
				@otp = otp
				UserMailer.confirmation_email(otp, params[:name], params[:email]).deliver_now
			else
				flash[:notice] = "Owner Already Exists"
				return redirect_to '/signup'
			end
		elsif params[:role] == "customer"
			customer = User.find_by(email: params[:email], role: 'customer')
			if not customer
				customer = User.create(
					:name => params[:name],
					:email => params[:email],
					:password => params[:password],
					:phone => params[:phone],
					:role => params[:role]
				)

				# flash[:notice] = "Signup Successful"
				# session[:user_id] = customer.id
				# session[:role] = user.role.to_s
				# return redirect_to '/'
				@user_id = customer.id
				otp = rand(9000) + 1000
				@otp = otp
				UserMailer.confirmation_email(otp, params[:name], params[:email]).deliver_now
			else
				flash[:notice] = "Customer Already Exists"
				return redirect_to '/signup'
			end
		else
			flash[:notice] = "Please Mention Your Identity!"
			return redirect_to '/signup'
		end
	end

	def confirm_signup
		user = User.find(params[:user_id])
		if params[:opt] == params[:entered_otp]
				user.send_welcome_mail
				flash[:notice] = "Signup Successful"
				session[:user_id] = user.id
				session[:role] = user.role.to_s
				return redirect_to '/'
		else
			user.destroy
			flash[:notice] = "Invalid OTP! Please Try Again"
			return redirect_to '/signup'
		end
	end

	def signin
	end

	def confirm_signin
		if params[:role] == "seller"
			seller = User.find_by(email: params[:email], role: 'seller')
			if not seller 
				flash[:notice] = "You Need To Signup First"
				return redirect_to '/signup'
			else
				if not seller.password == params[:password]
					flash[:notice] = "Wrong Password"
					return redirect_to '/signin'
				else
					session[:user_id] = seller.id
					session[:identity] = "seller"
					return redirect_to '/'
				end
			end
		elsif params[:role] == "customer"
			customer = User.find_by(email: params[:email], role: 'customer')
			if not customer 
				flash[:notice] = "You Need To Signup First"
				return redirect_to '/signup'
			else
				if not customer.password == params[:password]
					flash[:notice] = "Wrong Password"
					return redirect_to '/signin'
				else
					session[:user_id] = customer.id
					session[:role] = "customer"
					return redirect_to '/'
				end
			end
		else
			flash[:notice] = "Please Mention Your Identity!"
			return redirect_to '/signin'
		end
	end

	def signout
		session[:user_id] = nil
		session[:role] = nil
		return redirect_to '/'
	end

	private
		def abc
			return @abc
		end



end
