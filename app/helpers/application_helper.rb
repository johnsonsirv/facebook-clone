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
end
