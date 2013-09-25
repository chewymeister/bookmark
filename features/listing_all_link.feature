Feature: Listing all links
	Upon visiting the home page
	User should see saved links

	Scenario: When user visits the home page
	Given the user has added a link to "http://google.com" and given it a title "Google"
	When the user visits the home page
	Then the user will find a link

	Scenario: Listing by tags
  Given the user adds four links
	When the user visits the search page
	Then the user will not find the tags "Makers Academy"
	And the user will not find the url "Code.org"
	And the user will find the title "Google"
	And the user will find the title "Bing"


# 	scenario "filtered by a tag" do
#   visit '/tags/search'
#   expect(page).not_to have_content("Makers Academy")
#   expect(page).not_to have_content("Code.org")
#   expect(page).to have_content("Google")
#   expect(page).to have_content("Bing")
# end

