Feature: Listing all links
	Upon visiting the home page
	User should see saved links

	Scenario: When user visits the home page
	Given the user has added a link to "http://google.com" and given it a title "Google"
	When the user visits the home page
	Then the user will find a link

  Scenario: Listing by tags
  Given there are the following links in the system:
    | url                           | title          | tags      |
    | http://www.makersacademy.com  | Makers Academy | education |
    | http://www.google.com         | Google         | search    |
    | http://www.bing.com           | Bing           | search    |
    | http://www.code.org           | Code.org       | education |
    | http://www.bbc.co.uk          | bbc            | news      |
  When the user visits the filtered page
  Then the user will not find the tags "Makers Academy"
  And the user will not find the url "Code.org"
  And the user will find the title "Google"
  And the user will find the title "Bing"

  Scenario Outline: Tags
    Given there is a link "<title>" pointing to "<url>" with the tag "<tag>"
    When the user visits the "<tag>" page
    Then the user should see "<title>"

    Examples:
      | url                           | title          | tag       |
      | http://www.makersacademy.com  | Makers Academy | education |
      | http://www.google.com         | Google         | search    |
      | http://www.bing.com           | Bing           | search    |
      | http://www.code.org           | Code.org       | education |



