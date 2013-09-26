require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'
require './lib/link'
require './lib/tag'
require './lib/user'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
	use Rack::Flash
	set :views, "#{File.dirname(__FILE__)}/views"
	
	enable :sessions
	set :session_secret, 'super secret'

	helpers do
	  def current_user
	    @current_user ||=User.get(session[:user_id]) if session[:user_id]
	  end
	end

	get '/' do
	  @links = Link.all
	  erb :index
	end

	get '/tags/:text' do
	  tag = Tag.first(:text => params[:text])
	  @links = tag ? tag.links : []
	  erb :index
	end

	get '/users/new' do
		@user = User.new
	  erb :"users/new"
	end

	post '/links' do
	  url = params["url"]
	  title = params["title"]
		tags = params["tags"].split(" ").map do |tag|
			  Tag.first_or_create(:text => tag)
			end
		Link.create(:url => url, :title => title, :tags => tags)
	  redirect to('/')
	end

	post '/users' do
	  @user = User.create(:email => params[:email], 
	             		 :password => params[:password],
	             		 :password_confirmation => params[:password_confirmation])
	  if @user.save
	    session[:user_id] = @user.id
	    redirect to('/')
	  else
	  	flash[:notice] = "Sorry, your passwords don't match"
	    erb :"users/new"
	  end
	end

end
