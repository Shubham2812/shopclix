class Profile < ActiveRecord::Base
  belongs_to :user

  def avatar
  	if photo
  		return '/uploads/profiles/' + id.to_s + '_' + photo
  	else
  		return '/images/profile.png'
  	end
  end
end
