# frozen_string_literal: true

module UsersHelper
  def show_banner_call_to_action_for(user, btn1 = 'btn-timeline-friend', btn2 = 'btn-timeline-friend')
    return update_info_btn if current_user == user

    return pending_friendship_btn(user, btn2) if current_user
                                                 .pending_friend_request_to?(user)

    return accept_friend_request_btns(user, btn1, btn2) if current_user
                                                           .pending_friend_request_from?(user)

    return unfriend_btn(user, btn2) if current_user.friends_with?(user)

    friendship_btn(user, btn1)
  end
  
  def update_info_btn
    link_to 'Update Info', '#', class: 'btn btn-timeline-friend', title: 'Update Info'
  end
  
  def friendship_btn(user, btn1)
    link_to 'Add Friend', friendships_path(other_user: user),
    method: :post,
    class: "btn #{btn1}",
    title: 'Send friend Request'
  end
  
  def pending_friendship_btn(user, btn2)
    link_to 'Friend Request sent', friendship_path(user),
    method: :delete,
    data: { confirm: 'Are you sure you want to remove this request?' },
    class: "btn #{btn2}",
    title: 'Delete friend request'
  end
  
  def accept_friend_request_btns(user, btn1, btn2)
    "#{confirm_friendship_btn(user, btn1)}
    #{delete_friendship_btn(user, btn2)}".html_safe
  end
  
  def confirm_friendship_btn(user, btn1)
    link_to 'Confirm Friend', friendship_path(user),
    method: :patch,
    class: "btn #{btn1}",
    title: 'Confirm friend request'
  end
  
  def delete_friendship_btn(user, btn2)
    link_to 'Remove Request', friendship_path(user),
    method: :delete,
    data: { confirm: 'Are you sure you want to remove this request?' },
    class: "btn #{btn2}",
    title: 'Delete friend request'
  end
  
  def unfriend_btn(user, btn2)
    link_to 'Friends', friendship_path(user),
    method: :delete,
    data: { confirm: 'You are about to unfriend this friend?' },
    class: "btn #{btn2}",
    title: 'Click to Unfriend'
  end
  
  def count_friends_for(user)
    if friends?(user)
      return Friendship
             .confirmed_friends_for(user).size
    end
    
    'no friends yet'
  end
  
  def friends?(user)
    Friendship
      .confirmed_friends_for(user).any?
  end
  
  def friends_for(user)
    Friendship
      .confirmed.where(user: user)
      .limit(5).map(&:friend)
    
  end
  
  def mutual_friends_with?(user)
    Friendship
      .mutual_friends_between(current_user, user)
      .any? && current_user != user
  end
  
  def mutual_friends_with(user)
    Friendship
      .find_by_sql(["SELECT friendships.*
    FROM friendships
    WHERE friendships.user_id = ?
    AND friendships.friend_id
    IN ( SELECT friendships.friend_id
          FROM friendships
          WHERE friendships.user_id = ?
          AND confirmed = ?
        ) LIMIT ?;", user.id, other_user.id, true, 5]).map(&:friend)
  end
end
