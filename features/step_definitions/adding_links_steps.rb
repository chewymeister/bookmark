
Given(/^the user visits the home page for the first time$/) do
	visit('/')
end

When(/^the page has no links$/) do
	expect(Link.count).to eq 0
end

Then(/^the user adds a link to "(.*?)" and gives it a title "(.*?)"\.$/) do |url, title|
	add_link(url, title)
end

Then(/^the user adds a link to "(.*?)" and gives it a title "(.*?)" and the tag "(.*?)"$/) do |url, title, tags|
	add_link(url, title, tags)
end

Then(/^the link should go to "(.*?)"$/) do |url|
	link = Link.first
	expect(link.url).to eq "#{url}"
end

Then(/^the title should be "(.*?)"$/) do |title|
	link = Link.first
	expect(link.title).to eq "#{title}"
end

Then(/^the tag should include "(.*?)"$/) do |tag|
	link = Link.first
  expect(link.tags.map(&:text)).to include(tag)
end

  def add_link(url, title, tags = '')
    within('#new-link') do
      fill_in 'url', :with => url
      fill_in 'title', :with => title
      # our tags will be space separated
# ==============================================================#    
# 											CHANGED EVGENY CODE											#
# ==============================================================#    
      # fill_in 'tags', :with => tags.split(' ')
      fill_in 'tags', :with => tags
      click_button 'Add link'
    end      
  end

