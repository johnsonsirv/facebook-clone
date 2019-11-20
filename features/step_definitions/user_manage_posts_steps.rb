# frozen_string_literal: true

Given('a user with email {string} is already logged in') do |current_user_email|
  @user = FactoryBot.create(:user, email: current_user_email)
  visit new_user_session_path
  within '.default-user-login' do
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log In'
  end
end

When('I submit new post using post form') do
  @post = FactoryBot.build(:post)
  within '.new-post' do
    fill_in 'post[content]', with: @post.content
    click_button 'Post'
  end
end

Then('I should see post in timeline') do
  expect(page).to have_content(@post.content)
end

When('I choose edit post from dropdown menu') do
  @post = FactoryBot.create(:post, user: @user)
  visit edit_post_path @post
end

When('I submit post update') do
  @post_update = FactoryBot.build(:post, content: 'Updated Post Content')
  fill_in 'post[content]', with: @post_update.content
  click_button 'Update'
end

Then('post content should be updated') do
  expect(page).to have_content(@post_update.content)
end

When('I choose delete post from dropdown menu') do
  @post = FactoryBot.create(:post, user: @user)
  @post.destroy
end

Then('post should no longer exist') do
  deleted_post = Post.find_by(id: @post)
  expect(deleted_post).to be_nil
end
