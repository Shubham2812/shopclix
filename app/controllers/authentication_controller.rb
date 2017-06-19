class AuthenticationController < ApplicationController

	def signup
	end

	def confirm_signup
		byebug
		if params[:role] == "seller"
			seller = User.find_by(email: params[:email], role: 'seller')
			if not seller
				seller = User.create(
					:name => params[:name],
					:email => params[:email],
					:password => params[:password],
					:phone => params[:phone],
					:role => 'seller'
				)
				flash[:notice] = "Signup Successful"
				session[:user_id] = seller.id
				session[:role] = 'seller'
				return redirect_to '/'
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
				session[:user_id] = customer.id
				session[:role] = 'customer'
				flash[:notice] = "Signup Successful"
				return redirect_to '/'
			else
				flash[:notice] = "Customer Already Exists"
				return redirect_to '/signup'
			end
		else
			flash[:notice] = "Please Mention Your Identity!"
			return redirect_to '/signup'
		end
	end

	def signin
	end

	def confirm_signin
		byebug
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



end
