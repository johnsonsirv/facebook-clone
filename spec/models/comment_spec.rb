require 'rails_helper'

RSpec.describe Comment, type: :model do
   context "Associations" do
		it { should belong_to(:user) }
		it { should belong_to(:post) }
		it { should have_many(:likes) }
	end
	
	context "validations" do
		before do
    	@comment = FactoryBot.create(:comment)
  	end
		it 'is invalid when comment content is null or empty' do
			comment2 = FactoryBot.build(:comment, content: nil)
			expect(comment2).to_not be_valid
		end

		it 'is valid when comment content has value' do
			expect(@comment).to be_valid
		end
	end
end
