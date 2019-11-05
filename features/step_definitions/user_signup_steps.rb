# frozen_string_literal: true

Given('I am on the signup page') do
  visit new_user_registration_path
end

When('I submit required fields') do
  within '.user-signup-main' do
    @params = FactoryBot.build(:user)
    fill_in 'user[firstname]', with: @params.firstname
    fill_in 'user[lastname]', with: @params.lastname
    fill_in 'user[email]', with: @params.email
    fill_in 'user[password]', with: @params.password
    select @params.dob.day, from: 'user[dob(3i)]'
    select Date::MONTHNAMES[@params.dob.month], from: 'user[dob(2i)]'
    select @params.dob.year, from: 'user[dob(1i)]'
    choose @params.sex

    click_button 'Sign Up'
  end
end

Then('I should see my bio') do
  fullname = "#{@params.firstname.capitalize!} #{@params.lastname.capitalize!}"
  expect(page).to have_content @params.firstname
end
