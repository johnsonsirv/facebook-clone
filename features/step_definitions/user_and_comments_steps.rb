Given("I can see the first post in my timeline") do
 @post = FactoryBot.build(:post)
  within '.new-post' do
		fill_in "post[content]", with: @post.content
		click_button 'Post'
	end
end

When("I submit new comment using comment form") do
	@comment = FactoryBot.build(:comment)
  within '.comment-editor' do
		fill_in "comment[content]", with: @comment.content
		click_button 'Comment'
	end
end

Then("I should see my comment for first post in timeline") do
 expect(page).to have_content(@comment.content)
end

Given("I have added a comment to the first post") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I delete comment") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("post comment should no longer exist") do
  pending # Write code here that turns the phrase above into concrete actions
end