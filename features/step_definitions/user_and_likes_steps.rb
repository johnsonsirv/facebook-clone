# frozen_string_literal: true

Given('I can see a post in my timeline') do
  @post = FactoryBot.create(:post)
  within '.new-post' do
    fill_in 'post[content]', with: @post.content
    click_button 'Post'
  end
end

Given('I can see a comment for this post') do
  @comment = FactoryBot.build(:comment)
  within '.comment-editor' do
    fill_in 'comment[content]', with: @comment.content
    click_button 'Comment'
  end
end

When('I like post') do
  within '.post-social-actions' do
    click_link 'Like'
  end
end

Then('post likes should contain user') do
  liker = Post.last.likes.find_by(user_id: @user)
  expect(liker).to be_valid
end

Given('I have liked post') do
  within '.post-social-actions' do
    click_link 'Like'
  end
end

When('I unlike post') do
  within '.post-social-actions' do
    click_link 'Unlike'
  end
end

Then('post likes should not contain user') do
  liker = Post.last.likes.find_by(user_id: @user)
  expect(liker).to be_nil
end

When('I like post comment') do
  within '.comment-actions' do
    click_link 'Like'
  end
end

Then('comment likes should contain user') do
  liker = Comment.last.likes.find_by(user_id: @user)
  expect(liker).to be_valid
end

Given('I have liked comment') do
  within '.comment-actions' do
    click_link 'Like'
  end
end

When('I unlike comment') do
  within '.comment-actions' do
    click_link 'Unlike'
  end
end

Then('comment likes should not contain user') do
  liker = Comment.last.likes.find_by(user_id: @user)
  expect(liker).to be_nil
end
