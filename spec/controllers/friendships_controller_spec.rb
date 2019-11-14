# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  it {
    should route(:get, '/friends')
      .to(action: :index)
  }

  it {
    should route(:get, '/friend_requests')
      .to(action: :friend_requests)
  }
  
   it {
    should route(:get, '/mutual_friends')
      .to(action: :mutual_friends)
  }
end
