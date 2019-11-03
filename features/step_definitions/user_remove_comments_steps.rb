# frozen_string_literal: true

Given('I can see the second post in my timeline') do
  @post = FactoryBot.create(:post, content: '2nd Post')
end

Given('I have added a coment') do
  @comment = @post.comments.create(content: '2nd Comment')
end

When('I delete comment') do
  @comment.destroy
end

Then('post comment should no longer exist') do
  deleted_comment = Comment.find_by(id: @comment)
  expect(deleted_comment).to be_nil
end
