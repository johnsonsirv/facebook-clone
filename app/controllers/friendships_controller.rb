# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    new_request = current_user.request_new_friendship_with(params[:other_user])
    set_flash_notice 'notice', new_request
    redirect_back fallback_location: root_path
  end

  def update
    other_user = User.find_by(id: params[:id])
    confirmed = Friendship.confirm_friend_request_for(current_user, other_user)
    set_flash_notice 'notice', 'Friendship confirmed' if confirmed
    redirect_back fallback_location: root_path
  end

  def destroy
    friend = User.find_by(id: params[:id])
    Friendship.remove_friendship_between(current_user, friend)
    set_flash_notice 'notice', 'Friendship Removed'
    redirect_back fallback_location: root_path
  end

  def friend_requests
    @friends = Friendship.unconfirmed_friends_for current_user
    render 'friends'
  end

  def mutual_friends
    other_user = User.find_by(id: params[:id])
    return if current_user == other_user

    @mutual_friends = Friendship.mutual_friends_between(user, other_user)
  end
end
