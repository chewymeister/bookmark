@sign_in_out
Feature: User forgets their password

  Scenario: and retrieves a new password
    Given user goes to sign in page
    Given user clicks the "Reset Password" button
    When the user enters the email "test@test.com"
    And clicks the button "Send Password Token"
    Then the message "An email has been sent to you providing you a link to reset your password" is displayed to the user
    


  Scenario: and creates a new password
    Then the user enters password "test1" with password confirmation "test1"
    Then the user should see the message "You have reset your password"