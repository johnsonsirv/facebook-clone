module ApplicationHelper
	
	def visible_top_menu
		return user_top_menu if  user_signed_in?
		visitor_top_menu
	end
	
	def user_top_menu
		'user_top_menu'
	end
	
	def visitor_top_menu
		'visitor_top_menu'
	end
	
	 def gravatar_for(user, size: 120)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.fullname)
  end
end
