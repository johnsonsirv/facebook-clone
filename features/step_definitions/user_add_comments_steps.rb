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