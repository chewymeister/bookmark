
Given(/^the user has added a link to "(.*?)" and given it a title "(.*?)"$/) do |url, title|
	Link.create(:url => "#{url}",:title => "#{title}")
end

When(/^the user visits the home page$/) do
	visit('/')
end

Then(/^the user will find a link$/) do
	expect(has_selector?('a')).to be_true
end
