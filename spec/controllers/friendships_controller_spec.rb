require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  it { should route(:get, '/friends')
    .to(action: :index) }
  
  it { should route(:get, '/friend_requests')
    .to(action: :friend_requests) }
end
