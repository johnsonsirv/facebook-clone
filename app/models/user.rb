class User < ApplicationRecord
  before_create { email.strip.downcase! }
  before_create { generate_gravatar_for_user }
	
	has_many :posts
	
	scope :all_except, ->(user) { where.not(id: user) }
	
	# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
	
	def fullname
		"#{firstname} #{lastname}"
	end
	
	def add_new_post(post_params)
		posts.create(post_params)
	end
	
	private
	def generate_gravatar_for_user
    self.image_link = "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end
end
