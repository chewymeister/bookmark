@sign_in
Feature: User sign in

	Scenario: with correct credentials
	When the user visits the home page
	Then the user should not see the message "Welcome, test@test.com"
	And when the user signs in with the email "test@test.com" and the password "test"
	Then the user should see the message "Welcome, test@test.com"

  Scenario: with incorrect credentials
  When the user visits the home page
  Then the user should not see the message "Welcome, test@test.com"
  And when the user signs in with the email "test@test.com" and the password "wrong"
  Then the user will not see the message "Welcome, test@test.com"
  And the user will see the message "The email or password is incorrect"






# scenario "with incorrect credentials" do
#     visit '/'
#     expect(page).not_to have_content("Welcome, test@test.com")
#     sign_in('test@test.com', 'wrong')
#     expect(page).not_to have_content("Welcome, test@test.com")
#   end
