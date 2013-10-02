@sign_in_out

Feature: User adds a link
	Upon visiting the home page
	The user should be able to add links

	Scenario: When user adds a link to the home page
	Given the user visits the home page for the first time
	When the page has no links
	And when the user signs in with the email "test@test.com" and the password "test"
	Then the user adds a link to "http://google.com" and gives it a title "Google".
	And the link should go to "http://google.com"
	And the title should be "Google"


	Scenario: With a few tags
	Given the user visits the home page for the first time
	When the page has no links
	And when the user signs in with the email "test@test.com" and the password "test"
	Then the user adds a link to "http://google.com" and gives it a title "Google" and the tag "search engine"
	And the link should go to "http://google.com"
	And the title should be "Google"
	And the tag should include "search"
	And the tag should include "engine"