# frozen_string_literal: true

Given('a user with email {string} exists in database') do |valid_email|
  @user = FactoryBot.create(:user, email: valid_email)
end

Given('I access the login form') do
  visit new_user_session_path
end

When('I submit correct login credentials') do
  within '.default-user-login' do
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log In'
  end
end

Then('I should see my timeline') do
  expect(page).to have_current_path root_path
end

When('I submit incorrect login credentials') do
  within '.default-user-login' do
    fill_in 'user[email]', with: 'incorrect@email.com'
    fill_in 'user[password]', with: 'incorrectpassword'
    click_button 'Log In'
  end
end

Then('I should see login error') do
  expect(page).to have_current_path new_user_session_path
end

When('I access navbar login form') do
  visit new_user_registration_path
end

When('I submit correct credentials through the navbar form') do
  within '.navbar' do
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log In'
  end
end

Then('I should also see my timeline') do
  expect(page).to have_current_path root_path
end

When('I access post timeline') do
  visit posts_path
end

Then('I should be redirected to login') do
  expect(page).to have_current_path new_user_session_path
end

Given('I am signed in with facebook') do
  visit user_facebook_omniauth_authorize_path
end

Then('I should see user firstname {string}') do |firstname|
  expect(page).to have_text(firstname.titlecase)
end
