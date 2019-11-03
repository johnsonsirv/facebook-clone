# frozen_string_literal: true

class User < ApplicationRecord
  before_create { email.strip.downcase! }
  before_create { generate_gravatar_for_user }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

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

  private

  def generate_gravatar_for_user
    self.image_link = "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end
end
