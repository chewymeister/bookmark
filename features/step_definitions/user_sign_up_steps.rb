When(/^the user signs up as a new user with the email "(.*?)" and the password "(.*?)"$/) do |email, password|
	sign_up(email, password)
end

When(/^the user signs up with "(.*?)" and the password "(.*?)" and confirms with the password "(.*?)"$/) do |email, password, confirmation|
  sign_up(email, password, confirmation)
end

Then(/^the user count should go up by one$/) do
  expect(User.count).to eq 1
end

Then(/^the page should display the message "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

Then(/^the users email should be "(.*?)"$/) do |email|
  expect(User.first.email).to eq email
end

Then(/^the user count should not go up by one$/) do
  expect(User.count).to eq 0
end

def sign_up(email = "alice@example.com", 
              password = "oranges!", 
              password_confirmation = 'oranges!')
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
end