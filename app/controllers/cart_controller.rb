class CartController < ApplicationController
  def index
    if user_signed_in?
      if current_user.role == 'customer'
  	     @items = current_user.cart
      else
         flash[:notice] = "You Need to Sign In as a Customer to Access Cart!"
         return redirect_to '/'
      end
    else
      flash[:notice] = "You Need to Sign In First!"
      return redirect_to '/signin'
    end
  end

  def add
  	product = Product.find(params[:product_id])

  	if product.is_present_in_cart_for_user current_user
  		flash[:notice] = 'Item already Added'
  	else
  		current_user.carts.create(
  				product_id: params[:product_id]
  			)
  		flash[:notice] = "Successfully Added"
  	end
  		return redirect_to '/products/show/' + params[:product_id].to_s
  end

  def remove
  	product = Product.find(params[:product_id])
  	if product.is_present_in_cart_for_user current_user
	  	cart = Cart.find_by(user_id: current_user.id, product_id: params[:product_id])
      cart.destroy
	  	flash[:notice] = "Item Removed Successfully"
	  end
	return redirect_to '/cart'
  end

end
