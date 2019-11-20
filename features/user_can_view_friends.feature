Feature: User can see list of friends
	In order find friends and send friend requests
	As a user
	I want see list of users

Background:
	Given a user with email "demouser@onet.com" is already logged in
	
Scenario: View users
	Given the following users exist in database:
	| email |
	| user1@test.io |
	| user2@conrad.ca.co |
	| user3@prodo.com |
	When I find friends
	Then I should see a list of users
	And I should not see my profile