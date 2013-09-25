Feature: Listing all links
	Upon visiting the home page
	User should see saved links

	Scenario: When user visits the home page
	Given the user has added a link to "http://google.com" and given it a title "Google"
	When the user visits the home page
	Then the user will find a link

