Feature: User signs up

	Scenario: When being logged out
		When the user signs up as a new user with the email "alice@example.com" and the password "oranges!"
		Then the user count should go up by one
		And the page should display the message "Welcome, alice@example.com"
		And the users email should be "alice@example.com"
