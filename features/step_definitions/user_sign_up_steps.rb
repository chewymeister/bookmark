When(/^the user signs up as a new user with the email "(.*?)" and the password "(.*?)"$/) do |email, password|
	sign_up(email, password)
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

def sign_up(email = "alice@example.com",password = "oranges!")
  visit '/users/new'
  fill_in :email, :with => email
  fill_in :password, :with => password
  click_button "Sign up"
end
