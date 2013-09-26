@sign_in_out
Feature: User signs out

  Scenario: while being signed in
    Given the user is still signed in with the email "test@test.com" and the password "test"
    When the user clicks the button "Sign out"
    Then the user should see the message "Good bye!" displayed
    And the page should not display the message "Welcome, test@test.com"
