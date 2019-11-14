# frozen_string_literal: true

Given('the following users are friends:') do |table|
  i = 0
  list = []
  table.hashes.each do |record|
    list[i] = FactoryBot.create(:user, email: record['email'].to_s)
    i += 1
  end
  @user1 = list[0]
  @user2 = list[1]
  @user3 = list[2]

  Friendship.create(user: @user1, friend: @user2, confirmed: true)
  Friendship.create(user: @user2, friend: @user1, confirmed: true)

  Friendship.create(user: @user1, friend: @user3, confirmed: true)
  Friendship.create(user: @user3, friend: @user1, confirmed: true)

  Friendship.create(user: @user2, friend: @user3, confirmed: true)
  Friendship.create(user: @user3, friend: @user2, confirmed: true)
end

When('the user {string} view mutual friends') do |_string|
  @mutual_friend = Friendship.mutual_friends_between(@user1, @user3)
end

Then('{string} should be mutual friends with {string}') do |_string, _string2|
  expect(@mutual_friend.first).to eq(@user2)
end
