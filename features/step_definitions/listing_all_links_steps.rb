Given(/^the user has added a link to "(.*?)" and given it a title "(.*?)"$/) do |url, title|
	Link.create(:url => "#{url}",:title => "#{title}")
end

Given(/^there are the following links in the system:$/) do |links|
  links.hashes.each do |link|
    Link.create(:url => link['url'],
                :title => link['title'], 
                :tags => [Tag.first_or_create(:text => link['tags'])])
  end
end

When(/^the user visits the home page$/) do
	visit('/')
end

Then(/^the user will find a link$/) do
	expect(has_selector?('a')).to be_true
end

When(/^the user visits the filtered page$/) do
	visit('/tags/search')
end

Then(/^the user will not find the tags "(.*?)"$/) do |tag|
  expect(page).not_to have_content(tag)
end

Then(/^the user will not find the url "(.*?)"$/) do |url|
  expect(page).not_to have_content(url)
end

Then(/^the user will find the title "(.*?)"$/) do |title|
  expect(page).to have_content(title)
end


