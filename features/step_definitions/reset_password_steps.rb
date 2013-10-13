Given(/^user goes to sign in page$/) do
  visit('/sessions/new')
end

Given(/^user clicks the "(.*?)" button$/) do |button|
  click_button button
end

When(/^the user enters the email "(.*?)"$/) do |email|
  fill_in 'email', :with => email
end

When(/^clicks the button "(.*?)"$/) do |button|
  click_button button
end

Then(/^the message "(.*?)" is displayed to the user$/) do |message|
  expect(page).to have_content message
end

Then(/^the user enters password "(.*?)" with password confirmation "(.*?)"$/) do |password, password_confirmation|
  visit('/users/reset_password/abcde')

  fill_in 'password', :with => password
  fill_in 'password_confirmation', :with => password_confirmation
  click_button "Reset Password"
end