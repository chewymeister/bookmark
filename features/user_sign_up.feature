Feature: User signs up

	Scenario: when being logged out
		When the user signs up as a new user with the email "alice@example.com" and the password "oranges!"
		Then the user count should go up by one
		And the page should display the message "Welcome, alice@example.com"
		And the users email should be "alice@example.com"

	Scenario: with a password that doesn't match
		When the user signs up with "alice@example.com" and the password "oranges" and confirms with the password "retard"
		Then the user count should not go up by one
		And the current path should be "/users"
		And the user should see the message "Sorry, your passwords don't match"

	Scenario: with an email that is already registered
		Given that the user has already signed up
		When the user tries to sign up again
		Then the number of users do not increase by one
		And the message "This email is already taken" is displayed

