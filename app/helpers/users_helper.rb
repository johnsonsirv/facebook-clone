module UsersHelper
	
	def show_banner_call_to_action_for(user)
		return update_info_btn if current_user == user
		
		friendship_btn
	end
	
	def update_info_btn
		link_to 'Update Info', '#', class: "btn btn-timeline-friend", title: "Update Info"
	end
	
	def friendship_btn
		link_to 'Add Friend (Milestone 5)', '#', class: "btn btn-timeline-friend", title: "Milestone 5"
	end
end
