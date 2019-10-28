Feature: User manage posts
	In order share my posts with friends
	As a user
	I want to add, edit, remove posts

Background:
	Given a user with email "demouser@onet.com" is already logged in
	
Scenario: Add new Post
	When I submit new post using post form
	Then I should see post in timeline

Scenario: Edit my Post
	When I choose edit post from dropdown menu
	And I submit post update
	Then post content should be updated
	
Scenario: Remove my Post
	When I choose delete post from dropdown menu
	Then post should no longer exist