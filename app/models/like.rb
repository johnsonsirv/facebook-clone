class Like < ApplicationRecord
	belongs_to :likeable, polymorphic: true
	belongs_to :user
	
	def self.add_like_to_resource(type, user)
		type.likes.create(user: user)
	end
	
	def self.unlike_resource(type, user)
		like = type.likes.find_by(user: user)
		like.destroy
	end
	
end
