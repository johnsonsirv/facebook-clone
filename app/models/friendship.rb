class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  
  scope :pending_requests, -> { where(confirmed: false) }
  scope :confirmed, -> { where(confirmed: true) }
  
   default_scope -> { includes(:user) }
  
  validate :is_self_irreflexive
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  
  
  def self.confirm_friend_request_for(user, friend)
    friendship = where(user: user, friend: friend)
    .or(where(user: friend, friend: user))
    
    transaction do
      friendship.update(confirmed: true)
      user.friendships.create(friend: friendship.first.user, confirmed: true)
    end
  end
  
  def self.remove_friendship_between(user, friend)
    friendship = where(user: user, friend: friend)
    .or(where(user: friend, friend: user))
    
    friendship.destroy_all
  end
  
  def self.unconfirmed_friends_for(user)
     pending_requests.where(friend: user).map(&:user)
  end
 
  def self.confirmed_friends_for(user)
     confirmed.where(user: user).map(&:friend)
  end
  
  def self.mutual_friends_between(user, other_user)
     find_by_sql(["SELECT friendships.*
      FROM friendships
      WHERE friendships.user_id = ?
      AND friendships.friend_id
      IN ( SELECT friendships.friend_id
            FROM friendships
            WHERE friendships.user_id = ?
            AND confirmed = ?
          );", user.id, other_user.id, true]).map(&:friend)
  end
  
  
    private

    def is_self_irreflexive
      msg = "can't be friends with self"
      errors.add(:friendship_is_irreflexive!, msg) if user == friend
    end
end
