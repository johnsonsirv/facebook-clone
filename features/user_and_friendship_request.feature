Feature: User and Friendship Requests
	In order to make friends
	As a user
	I want to send or accept friend requests
  
Background:
	Given the following users exists:
  | email |
  | "demouser1@onet.com" |
  | "user2demo@carry.com" |

Scenario: Send a friend request
  Given "demouser1@onet.com" is logged in
  When I send request to "user2demo@carry.com"
  Then I should have pending request

Scenario: Accept friend request
  Given the user "user2demo@carry.com" logs in
  When I accept request from "demouser1@onet.com"
  Then we should be friends