require 'sinatra'

get '/' do
  @links = Link.all
  erb :index
end