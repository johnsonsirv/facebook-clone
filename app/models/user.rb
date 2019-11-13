# frozen_string_literal: true

class User < ApplicationRecord
  before_create { email.strip.downcase! }
  before_create { generate_gravatar_for_user }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  scope :all_except, ->(user) { where.not(id: user) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def fullname
    "#{firstname} #{lastname}"
  end

  def add_new_post(post_params)
    posts.create(post_params)
  end

  def add_new_comment(comment_params)
    comments.create(comment_params)
  end
  
   def request_new_friendship_with(other_user)
    new_friend = User.find_by(id: other_user)
    return 'Friend request sent' if friendships.create(friend: new_friend)
  end
  
  def has_pending_friend_request_from?(other_user)
     Friendship.pending_requests
    .where(friend: self)
    .where(user: other_user).exists?
  end
  
  def has_pending_friend_request_to?(other_user)
    Friendship.pending_requests
    .where(user: self)
    .where(friend: other_user).exists?
  end
  
  def friends_with?(other_user)
    Friendship.confirmed
    .where(user: self)
    .where(friend: other_user).exists?
  end

  private

  def generate_gravatar_for_user
    self.image_link = "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end
end
