class ProductController < ApplicationController
  def index
  	@products = current_user.products
  end

  def add_edit
    @stores = current_user.stores
    if @stores.length == 0
      flash[:notice] = "Please Add A Store First!"
      return redirect_to '/store/add'
    end
    if params[:product_id]
      @product = Product.find(params[:product_id])
    end
  end

  def add_edit_product
  	store = Store.find(params[:store_id])
    if params[:product_id]
      product = Product.find(params[:product_id])
    else
      product = store.products.new
    end

  	product.name = params[:name]
  	product.price = params[:price].to_i
  	# product.category = params[:category]
  	product.description = params[:description]
  	product.color = params[:color]
    product.store_id = params[:store_id]
    
    product.save

    if params['photo']
        if product.photo
          file_name = product.id.to_s + '_' + product.photo
          File.delete(Rails.root.join('public', 'uploads', 'products', file_name))
        end

        product.photo = params[:photo].original_filename
        file_name = product.id.to_s + "_" + product.photo
        temp_file = params["photo"]
        File.open(Rails.root.join('public', 'uploads', 'products', file_name), 'wb') do |file|
          file.write(temp_file.read)
        end
    end
    
    product.save

  	flash[:notice] = 'Product Added Sucessfully'
  	return redirect_to '/products'
  end

  def show
    @product = Product.find(params[:product_id])
    render '_product2', locals: {product: @product}
  end

  def delete
    product = Product.find(params[:product_id])
    product.destroy
    return redirect_to '/products'
  end
end
