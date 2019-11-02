Given("I can see a post in my timeline") do
  @post = FactoryBot.create(:post)
end

Given("I can see a comment for this post") do
 @comment = @post.comments.create(content: "Comment")
end

When("I like post") do
	visit root_path
  click_button 'Like'
end

Then("post likes should contain user") do
  liker = @post.likes.find_by(id: @user)
	expect(liker).to be_valid
end

Given("I have liked post") do
  visit root_path
  click_button 'Like'
end

When("I unlike post") do
  click_button 'Unlike'
end

Then("post likes should not contain user") do
  liker = @post.likes.find_by(id: @user)
	expect(liker).to be_nil
end

When("I like post comment") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("comment likes should contain user") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I have liked comment") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I unlike comment") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("comment likes should not contain user") do
  pending # Write code here that turns the phrase above into concrete actions
end
