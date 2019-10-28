require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
		it { should have_many(:posts)}
	end
	
	it 'should build user image_link before save' do
		it { should use_before_callback(:generate_gravatar_for_user) }
	end
end
