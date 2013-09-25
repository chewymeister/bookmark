ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'bookmark_manager.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'database_cleaner'
require 'database_cleaner/cucumber'

Capybara.app = BookmarkManager

class BookmarkManagerWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end

World do
  BookmarkManagerWorld.new
end
