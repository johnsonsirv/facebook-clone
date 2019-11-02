class Comment < ApplicationRecord
	belongs_to :user
  belongs_to :post
	has_many :likes, as: :likeable, dependent: :destroy
	
	default_scope -> { order(created_at: :desc).includes(:user) }
	
	validates :content, presence: true
	
	
end
