# frozen_string_literal: true

Given('a user with email {string} is logged in') do |current_user_email|
  @user = FactoryBot.create(:user, email: current_user_email)
  visit new_user_session_path
  within '.default-user-login' do
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log In'
  end
end

When('I click logout') do
  within '.dropdown-menu' do
    click_link 'Logout'
  end
end

Then('my current session should terminate') do
  visit user_path @user
  expect(page).not_to have_current_path user_path @user
end
