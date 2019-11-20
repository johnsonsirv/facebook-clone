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
  devise :omniauthable, omniauth_providers: %i[facebook]

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

  def pending_friend_request_from?(other_user)
    Friendship.pending_requests
              .where(friend: self)
              .where(user: other_user).exists?
  end

  def pending_friend_request_to?(other_user)
    Friendship.pending_requests
              .where(user: self)
              .where(friend: other_user).exists?
  end

  def friends_with?(other_user)
    Friendship.confirmed
              .where(user: self)
              .where(friend: other_user).exists?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      names = auth.info.name.split
      user.firstname = names.first
      user.lastname = names.last
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.sex = 'Custom'
      user.dob = 18.years.ago
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  private

  def generate_gravatar_for_user
    self.image_link = "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end
end
