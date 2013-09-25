
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

When(/^the user visits the search page$/) do
	visit('/tags/search')
end

Then(/^the user will not find the tags "(.*?)"$/) do |tag|
	# expect(link.tags.map(&:text)).to include(tag)
  # expect(has_content?(tag)).to be_false
  expect(page).not_to have_content(tag)
end

Then(/^the user will not find the url "(.*?)"$/) do |url|
  # expect(link.url).to eq "#{url}"
  # expect(has_content?(url)).to be_false 
  expect(page).not_to have_content(url)
end

Then(/^the user will find the title "(.*?)"$/) do |title|
  # expect(has_content?(title)).to be_true
  expect(page).to have_content(title)
end

Given(/^there is a link "(.*?)" pointing to "(.*?)" with the tag "(.*?)"$/) do |title, url, tag|
  Link.create(:url => url,
              :title => title, 
              :tags => [Tag.first_or_create(:text => tag)])
end

When(/^the uses visits the "(.*?)" page$/) do |urn|
  visit "/tags/#{urn}"
end

Then(/^the user should see "(.*?)"$/) do |title|
  expect(page).to have_content(title)
end

# expect().not_to have_content("Makers Academy")
#   expect(page).not_to have_content("Code.org")
#   expect(page).to have_content("Google")
#   expect(page).to have_content("Bing")
# end