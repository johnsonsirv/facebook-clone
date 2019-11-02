FactoryBot.define do
  factory :comment do
     user
		
		content { "This is a test comment" }
  end
end
