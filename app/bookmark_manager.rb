require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'
require_relative './models/link'
require_relative './models/tag'
require_relative './models/user'

require_relative 'data_mapper_setup'

require_relative './controllers/index'
require_relative './controllers/links'
require_relative './controllers/sessions'
require_relative './controllers/tags'
require_relative './controllers/users'
require_relative './controllers/new_password'

class BookmarkManager < Sinatra::Base
	use Rack::Flash
	use Rack::MethodOverride
  # register Sinatra::Partial
  # set :partial_template_engine, :erb

	set :views, "#{File.dirname(__FILE__)}/views"
	
	enable :sessions
	set :session_secret, 'super secret'

	helpers do
	  def current_user
	    @current_user ||=User.get(session[:user_id]) if session[:user_id]
	  end
	end

end
