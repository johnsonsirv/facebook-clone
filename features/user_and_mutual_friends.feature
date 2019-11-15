Feature: User and Mutual Friendship
	In order to expand my network
	As a user
	I want to see my mutual friends
  
Background:
	Given the following users are friends:
  | email |
  | "demouser1@onet.com" |
  | "user2demo@carry.com" |
  | "user3test@loki.io" | 

Scenario: Send a friend request
  When the user "demouser1@onet.com" view mutual friends
  Then "user2demo@carry.com" should be mutual friends with "user3test@loki.io"