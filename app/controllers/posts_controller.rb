class PostsController < ApplicationController
	before_action :get_timeline_posts, only: [:index]
	before_action :initialize_new_post_editor, only: [:index]
	before_action :find_post, only: [:edit, :update, :destroy]
	
  def index ;  end ;
	
	def create
		save_post post_params
	end
	
	def edit;	end ;
	
	def update
		post_update post_params
	end
	
	def destroy
		@post.destroy
		set_flash_notice 'notice', 'Post deleted'
		redirect_to root_path
	end

	private
	
	def get_timeline_posts
		@posts = Post.timeline_posts_for current_user
	end
	
	def save_post(post_params)
		@post = current_user.add_new_post(post_params)
		if @post.errors.any?
			set_flash_notice 'alert', 'Post could not be saved. Did you forget to write something?'
			redirect_back fallback_location: root_path
		else
			set_flash_notice 'notice', 'Post added successfully'
			initialize_new_post_editor
			redirect_back fallback_location: root_path
		end
	end
	
	def post_update(post_params)
		if @post.user.eql?(current_user)
			set_flash_notice 'notice', @post.update_post(post_params)
			redirect_to root_path
		else
			set_flash_notice 'alert', 'Permission denied for resource'
			redirect_to root_path
		end
	end
	
	def find_post
		@post = Post.find(params[:id])
	end
	
	def post_params
			params.require(:post).permit(:content)
	end
end

