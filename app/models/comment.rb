class Comment < ApplicationRecord
	belongs_to :user
  belongs_to :post
	has_many :likes, dependent: :destroy
	
	validates :content, presence: true
end
