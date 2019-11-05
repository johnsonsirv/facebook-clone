# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :get_created_posts, only: [:show]

  def index
    @users = User.all_except current_user
  end

  def show
    @user = find_user
  end

  private

  def find_user
    User.find_by(id: params[:id])
  end

  def get_created_posts
    initialize_new_post_editor
    @posts = Post.authored_by find_user
  end
end
