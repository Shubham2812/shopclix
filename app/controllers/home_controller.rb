class HomeController < ApplicationController
  def index
    @products = Product.all
    @electronics = Store.where(category: 1)
    @appliances = Store.where(category: 2)
    @men = Store.where(category: 3)
    @women = Store.where(category: 4)
    @kids = Store.where(category: 5)
    @books = Store.where(category: 6)
    @furniture = Store.where(category: 7)
    @others = Store.where(category: 8)
    
  end

  def profile
  	@profile = current_user.profile
  end

  def edit_profile_form
    @profile = current_user.profile
  end

  def edit_profile
  	user = current_user
    user.name = params[:name]
  	user.phone = params[:phone]
  	user.save!
    
    profile = current_user.profile

    if not profile
  		profile = Profile.new
      profile.user_id = current_user.id
    end  
  				
  	profile.address = params[:address]
    profile.city = params[:city]
  	profile.pin = params[:pin]
    profile.gstin = params[:gstin]
    profile.aadhar_no = params[:aadhar_no]

    profile.save

  	if params['photo']
        if profile.photo
          file_name = profile.id.to_s + '_' + profile.photo
          File.delete(Rails.root.join('public', 'uploads', 'profiles', file_name))
        end

        profile.photo = params[:photo].original_filename
        file_name = profile.id.to_s + "_" + profile.photo
        temp_file = params["photo"]
        File.open(Rails.root.join('public', 'uploads', 'profiles', file_name), 'wb') do |file|
          file.write(temp_file.read)
        end
        profile.save
    end

    return redirect_to '/profile'
  end

  def team
  end

  def search
    # byebug
    items = Product.where("name like '%#{params[:search]}%' ") + Store.where("name like '%#{params[:search]}%' ")
    render json: items
  end

  def search_result
    # byebug
    product = Product.find_by(name: params[:search])
    store = Store.find_by(name: params[:search])
    
    if product
      path = '/products/show/' + product.id.to_s
      return redirect_to path
    elsif store
      path = '/stores/show/' + store.id.to_s
      return redirect_to path
    else
      flash[:notice] = "No Match Found"
      return redirect_to '/'
    end
  end
end
