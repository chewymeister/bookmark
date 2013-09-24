require 'sinatra'
require 'data_mapper'
# require './lib/link'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require './lib/link'
DataMapper.finalize
DataMapper.auto_upgrade!

set :views, "#{File.dirname(__FILE__)}/views"

get '/' do
  @links = Link.all
  erb :index
end