Then(/^the user should not see the message "(.*?)"$/) do |message|
	expect(page).not_to have_content(message)
end

Then(/^when the user signs in with the email "(.*?)" and the password "(.*?)"$/) do |email, password|
  sign_in email, password
end

Then(/^the user will not see the message "(.*?)"$/) do |message|
	expect(page).not_to have_content(message)
end

Then(/^the user will see the message "(.*?)"$/) do |message|
	expect(page).to have_content(message)
end

def sign_in(email, password)
  visit '/sessions/new'
  fill_in 'email', :with => email
  fill_in 'password', :with => password
  click_button 'Sign in'
end