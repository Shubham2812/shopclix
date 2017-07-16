class StoreController < ApplicationController
  def index
  	@stores = current_user.stores
  end

  def products
  	@store = Store.find(params[:store_id])
  	@products = @store.products
  end

  def add_edit
    if params[:store_id]
      @store = Store.find(params[:store_id])
    else
      if not current_user.profile
        flash[:notice] = 'You must Complete Your Profile First'
        return redirect_to '/profile/edit'
      end
    end

  end

  def add_edit_store
    if params[:store_id]
      store = Store.find(params[:store_id])
    else
      store = current_user.stores.new
    end 
    	
    store.name = params[:name]
    store.location = params[:location]
    store.contact = params[:contact]
    store.description = params[:description]
    store.category = params[:category]
  		
    store.save

  	if params['photo']
  		if store.photo
			   file_name = store.id.to_s + '_' + store.photo
			   File.delete(Rails.root.join('public', 'uploads', 'stores', file_name))
	 	   end

  		store.photo = params[:photo].original_filename
  		file_name = store.id.to_s + "_" + store.photo
  		temp_file = params["photo"]
  		File.open(Rails.root.join('public', 'uploads', 'stores', file_name), 'wb') do |file|
  			file.write(temp_file.read)
  		end
    end
  		
    store.save

  	flash[:notice] = 'Store Added Sucessfully'
  	return redirect_to '/stores'
  end

  def delete
    store = Store.find(params[:store_id])
    store.products.destroy
    store.destroy
    return redirect_to '/stores'
  end
end
