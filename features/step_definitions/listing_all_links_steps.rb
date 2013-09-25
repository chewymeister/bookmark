
Given(/^the user has added a link to "(.*?)" and given it a title "(.*?)"$/) do |url, title|
	Link.create(:url => "#{url}",:title => "#{title}")
end

Given(/^the user adds four links$/) do
  Link.create(:url => "http://www.makersacademy.com",
              :title => "Makers Academy", 
              :tags => [Tag.first_or_create(:text => 'education')])
  Link.create(:url => "http://www.google.com", 
              :title => "Google", 
              :tags => [Tag.first_or_create(:text => 'search')])
  Link.create(:url => "http://www.bing.com", 
              :title => "Bing", 
              :tags => [Tag.first_or_create(:text => 'search')])
  Link.create(:url => "http://www.code.org", 
              :title => "Code.org", 
              :tags => [Tag.first_or_create(:text => 'education')])
  link = Link.all
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
  expect(has_content?(tag)).to be_false
end

Then(/^the user will not find the url "(.*?)"$/) do |url|
  # expect(link.url).to eq "#{url}"
  expect(has_content?(url)).to be_false 
end

Then(/^the user will find the title "(.*?)"$/) do |title|
  expect(has_content?(title)).to be_true
end



# expect().not_to have_content("Makers Academy")
#   expect(page).not_to have_content("Code.org")
#   expect(page).to have_content("Google")
#   expect(page).to have_content("Bing")
# end