require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:friend).class_name('User') }
  
  context 'validations' do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
    end
    
    it 'is invalid without a user or friend' do
      @friendship = Friendship.create(user: @user1)
      expect(@friendship).to_not be_valid
    end
    
    it 'is valid with a user and friend' do
      @friendship = Friendship.create(user: @user1, friend: @user2)
      expect(@friendship).to be_valid
    end
    
    it 'is invalid when a user is the same as friend' do
      @friendship = Friendship.create(user: @user1, friend: @user1)
      expect(@friendship).to_not be_valid
    end
    
  end
end
