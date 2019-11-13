# frozen_string_literal: true

module ApplicationHelper
  def visible_top_menu
    return user_top_menu if user_signed_in?

    visitor_top_menu
  end

  def user_top_menu
    'user_top_menu'
  end

  def visitor_top_menu
    'visitor_top_menu'
  end

  def gravatar_for(user, size: 120)
    gravatar_url = "#{user.image_link}?s=#{size}"
    image_tag(gravatar_url, alt: user.fullname)
  end

  def liked_by_user?(resource)
    resource.likes
            .find_by(user: current_user)
  end
  
  def count_friend_request(user)
    return Friendship
    .unconfirmed_friends_for(user)
    .size if has_request?(user)
    
    ''
  end
  
  def has_request?(user)
    Friendship
    .unconfirmed_friends_for(user).any?
  end
  
  def friend_requests_for(user)
    return Friendship
    .pending_requests.where(friend: user)
    .order(created_at: :desc)
    .limit(5).map(&:user)
  end
  
  def show_friend_request_icon(user)
    return link_to content_tag(:i, content_tag(:b, count_friend_request(user)), 
      class: 'fa fa-users has-request'), 
    friend_requests_path, 
    title: "#{pluralize(count_friend_request(user), 'Friend request')}", 
    class: 'nav-link' if has_request?(user)
    
    link_to content_tag(:i, '', 
    class: 'fa fa-users'), 
    friend_requests_path,
    title: 'No Friend request',
    class: 'nav-link'
  end
  
end
