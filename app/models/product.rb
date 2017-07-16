class Product < ActiveRecord::Base
  belongs_to :store

  def avatar
  	if photo
  		return '/uploads/products/' + id.to_s + '_' + photo
  	else
  		return '/images/product.png'
  	end
  end

  def is_present_in_cart_for_user user_id
  	product = Cart.find_by(user_id: user_id, product_id: id)
  	if product
  		return true
  	else
  		return false
  	end
  end
end
