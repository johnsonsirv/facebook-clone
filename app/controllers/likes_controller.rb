class LikesController < ApplicationController
		before_action :get_resource_to_be_liked
	
	def create
		return like_resource(@likeable) unless liked?(@likeable)
		destroy
	end
	
	def destroy
		Like.unlike_resource(@likeable, current_user)
		redirect_to back_with_anchored_resource anchor: @likeable.id
	end
	
	private
	def get_resource_to_be_liked
		 if params[:post_id]
      @likeable = Post.find_by_id(params[:post_id])
    elsif params[:comment_id]
      @likeable = Comment.find_by_id(params[:comment_id])
		 else
			 set_flash_notice 'alert', 'Resource not found'
			redirect_back fallback_location: root_path
    end
		
	end
	
	def like_resource(resource)
			Like.add_like_to_resource(resource, current_user)
			redirect_to back_with_anchored_resource anchor: resource.id
	end
	
	def liked?(resource)
		resource.likes.find_by(user: current_user)
	end
end
