# frozen_string_literal: true

module CommentsHelper
  def show_comment_actions_for(resource)
    "#{show_likeable_link_for(resource)} -
		#{reply_comment} -
		#{delete_comment_for(resource)} -".html_safe
  end

  def show_likeable_link_for(resource)
    return unlike_comment_link(resource) if liked_by_user?(resource)

    like_comment_link(resource)
  end

  def like_comment_link(resource)
    link_to 'Like', likes_path(comment_id: resource.id),
            method: :post, class: 'pr-1'
  end

  def unlike_comment_link(resource)
    link_to 'Unlike', likes_path(comment_id: resource.id),
            method: :post, class: 'pr-1 text unlike-link'
  end

  def delete_comment_for(resource)
    return link_to 'Delete', comment_path(resource),
    method: :delete, class: 'pr-1' if user_can_modify?(resource)
  end

  def user_can_modify?(comment)
    comment.user == current_user
  end

  def reply_comment
    link_to 'Reply', '#', class: 'pr-1'
  end
end
