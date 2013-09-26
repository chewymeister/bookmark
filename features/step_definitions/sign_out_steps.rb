Given(/^the user is still signed in with the email "(.*?)" and the password "(.*?)"$/) do |email, password|
	sign_in email,password
end

When(/^the user clicks the button "(.*?)"$/) do |button|
  click_button button
end

Then(/^the user should see the message "(.*?)" displayed$/) do |message|
  expect(page).to have_content message
end

Then(/^the page should not display the message "(.*?)"$/) do |message|
  expect(page).not_to have_content "Welcome, test@test.com"
end

def sign_in(email, password)
  visit '/sessions/new'
  fill_in 'email', :with => email
  fill_in 'password', :with => password
  click_button 'Sign in'
end

