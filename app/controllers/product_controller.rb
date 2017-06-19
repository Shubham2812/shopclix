class ProductController < ApplicationController
  def index
  	@products = current_user.products
  end

  def add
  end

  def add_product
  	store = Store.find(params[:store_id])
  	store.products.create(
  			name: params[:name],
  			price: params[:price].to_i,
  			category: params[:category],
  			description: params[:description],
  			color: params[:color]
  		)
  	flash[:notice] = 'Sucessfully Added'
  	return redirect to '/products'
  end
end
