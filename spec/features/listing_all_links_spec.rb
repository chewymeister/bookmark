require 'spec_helper'

feature "User browses the list of links" do

	before(:each) {
		Link.create(:url => 'http://google.com',
					:title => 'Google')
	}
	
	scenario "When opening the home page" do
		visit('/')
		expect(page).to have_content("Google")
	end

end