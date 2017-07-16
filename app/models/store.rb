class Store < ActiveRecord::Base
  belongs_to :user
  has_many :products

  def avatar
  	if photo
  		return '/uploads/stores/' + id.to_s + '_' + photo
  	else
  		return '/images/store.png'
  	end
  end
end
