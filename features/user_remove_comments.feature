Feature: User manage comments
	In ad my reactions to posts
	As a user
	I want to add or remove comments

Background:
	Given a user with email "demouser@onet.com" is already logged in
	And I can see the second post in my timeline

Scenario: Remove my comment
	Given I have added a coment
	When I delete comment
	Then post comment should no longer exist