module PostsHelper
	
	def show_post_actions_for(post)
		"#{ edit_button_for post}
			#{ change_post_date_for post}
			#{dropdown_item_divider}
			#{ hide_from_timeline_for post}
			#{delete_button_for post}".html_safe if user_can_modify?(post)
	end
	
	def user_can_modify?(post)
		post.user == current_user
	end
	
	def edit_button_for(resource)
		link_to 'Edit post', edit_post_path(resource), 
		class: 'dropdown-item'
	end
	
	def delete_button_for(resource)
		link_to 'Delete', resource, 
			method: :delete, 
			data: { confirm: 'You are about to delete this post. Do you want to continue?' }, 
			class: 'dropdown-item text-danger'
	end
	
	def hide_from_timeline_for(resource)
		link_to 'Hide from timeline', '#', 
		class: 'dropdown-item'
	end
	
	def change_post_date_for(resource)
		link_to 'Change date', '#', 
		class: 'dropdown-item'
	end
	
	def dropdown_item_divider
		content_tag(:div, '', class: 'dropdown-divider')
	end
	
	def unauthenticated_post_actions
		content_tag(:a, 'No actions', href: '#', class: 'dropdown-item')
	end
	
	def show_total_post_comments_for(post)
		return pluralize(post.comments.count, 'Comment') if post.comments.any?
		''
	end
	
	def show_total_post_likes_for(post)
		return "#{image_tag "icon-like.png"} #{post.likes.count }".html_safe if post.likes.any?
		''
	end
	
	def show_likeable_button_for_resource(resource)
		return unlike_button_for(resource) if liked_by_user?(resource)
		like_button_for(resource)
	end
	
	def like_button_for(resource)
		link_to content_tag(:i, "Like", class:"fa fa-thumbs-up pr-2"), 
			likes_path(post_id: resource.id), method: :post,
			class:"btn btn-sm social-btn"
	end
	
	def unlike_button_for(resource)
		link_to content_tag(:i, "Unlike", class:"fa fa-thumbs-up pr-2"), 
			likes_path(post_id: resource.id), method: :post,
			class:"btn btn-sm unlike-btn"
	end
end
