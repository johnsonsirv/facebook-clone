# frozen_string_literal: true

Given('the following users exist in database:') do |acc|
  acc.hashes.each do |a|
    FactoryBot.create(:user, email: a['email'])
  end
end

When('I find friends') do
  click_link 'Find Friends'
end

Then('I should see a list of users') do
  @user2 = User.second
  @user3 = User.third
  expect(page).to have_content("#{@user2.firstname} #{@user2.lastname}")
  expect(page).to have_content("#{@user3.firstname} #{@user3.lastname}")
end

Then('I should not see my profile') do
  expect(page).to_not have_content(@user.email)
end
