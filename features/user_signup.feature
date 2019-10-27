Feature: New User Signup
	In order to find friends, socialize, create posts, add comments and likes
	As a new user
	I want to create a new account

Background:
	Given I am on the signup page
	
Scenario: Submit valid credentials
	When I submit required fields	
	Then I should see my bio