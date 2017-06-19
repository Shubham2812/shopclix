class StoreController < ApplicationController
  def index
  	@stores = current_user.stores
  end

  def products
  	store = Store.find(params[:store_id])
  	@products = store.products
  end

  def add
  end

  def add_store
  	current_user.stores.create(
  			name: params[:name],
  			location: params[:location],
  			contact: params[:contant],
  			description: params[:description],
  			category: params[:category]
  		)
  	flash[:notice] = 'Store Added Sucessfully'
  	return redirect_to '/stores'
  end
end
