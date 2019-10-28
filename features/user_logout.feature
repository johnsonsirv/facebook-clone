Feature: Log current user out
	In order quit the application
	As a user
	I want to log off from all current activities

Background:
	Given a user with email "demouser@onet.com" is logged in
	
Scenario: End my session
	When I click logout
	Then my current session should terminate