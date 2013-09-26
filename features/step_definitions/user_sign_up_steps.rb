When(/^the user signs up as a new user with the email "(.*?)" and the password "(.*?)"$/) do |email, password|
	sign_up(email, password)
	# visit('/user/old')
end

Then(/^the user count should go up by one$/) do
	lambda { sign_up }.should change(User, :count).by(1)
  # pending # express the regexp above with the code you wish you had
end

Then(/^the page should display the message "(.*?)"$/) do |message|
  # expect(page).to have_content("Welcome, alice@example.com")
  expect(page).to have_content(message)
  # pending # express the regexp above with the code you wish you had
end

Then(/^the users email should be "(.*?)"$/) do |email|
  # pending # express the regexp above with the code you wish you had
    expect(User.first.email).to eq email
end

def sign_up(email = "alice@example.com",
              password = "oranges!")
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end
