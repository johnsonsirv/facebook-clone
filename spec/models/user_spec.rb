require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
		it { should have_many(:posts)}
	end
	
	it 'callbacks generate_gravatar_for_user before create' do
		@user = FactoryBot.build(:user)
		expect(@user.image_link).to be_nil
		
		@user.save
		expect(@user.image_link).to_not be_nil
	end
	
end
