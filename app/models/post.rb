# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  scope :authored_by, lambda { |user|
                        where(user_id: user).includes(:user)
                        .order(updated_at: :desc)
                        .includes(:comments).includes(:likes)
                      }
  scope :authored_by_user_or_friends, lambda { |user|
                                        where(user_id: user)
                                        .or(where(user_id: Friendship.confirmed_friends_for(user)))
                                        .includes(:user).order(updated_at: :desc)
                                        .includes(:comments).includes(:likes)
                                      }

  validates :content, presence: true

  def self.timeline_posts_for(user)
    authored_by_user_or_friends(user)
  end

  def update_post(post_params)
    if update_attributes post_params
      'Post updated'
    else
      'Post update failed'
    end
  end
end
