Given("the following users exists:") do |table|
  i = 0
  list = []
  table.hashes.each do |record|
    list[i] = FactoryBot.create(:user, email: record['email'].to_s)
    i += 1
  end
  @user1 = list[0]
  @user2 = list[1]
end

Given("{string} is logged in") do |current_user_email|
 visit new_user_session_path
  within '.default-user-login' do
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_button 'Log In'
  end
end

When("I send request to {string}") do |string|
  visit user_path @user1
  click_link 'Add Friend'
end

Then("I should have pending request") do
  expect(page).to have_content /Friend Request sent/
end

Given("the user {string} logs in") do |string|
 
end

When("I accept request from {string}") do |string|
  
end