Feature: User and likes
	In add my reactions to posts and comments
	As a user
	I want to like and unlike posts or comments

Background:
	Given a user with email "demouser@onet.com" is already logged in
	And I can see a post in my timeline
	And I can see a comemnt for this post

Scenario: Like a Post
	When I like post
	Then post likes should contain user
	
Scenario: Unlike a Post
	Given I have liked post
	When I unlike post
	Then post likes should not contain user
	
Scenario: Like a Comment
	When I like post comment
	Then comment likes should contain user
	
Scenario: Unlike a Comment
	Given I have liked comment
	When I unlike comment
	Then comment likes should not contain user