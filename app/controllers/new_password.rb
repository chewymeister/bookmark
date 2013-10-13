require 'sinatra'
require 'rest_client'
require 'securerandom'

class BookmarkManager < Sinatra::Base

  get '/users/reset_password/:token' do
    @user = User.first(:password_token => params[:token])
    limit = (Time.now - 60*60).to_datetime

    if limit < DateTime.now #@user.password_token_timestamp
      erb :"users/reset_password/new"
    else
      flash[:error] = "Token too old!"
    end
  end

  get '/users/reset_password/new' do
    erb :"/users/reset_password/new"
  end

  post '/users/reset_password/:token' do
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    @user = User.first(:password_token => params[:token])
    @user.password = password
    @user.password_confirmation = password_confirmation
    @user.save

    flash[:notice] = "You have reset your password"
    redirect to('/')
  end


  post '/new_password' do
    email = params[:email]
    @user = User.first(:email => email)
    if @user != nil
      @user.password_token = SecureRandom.urlsafe_base64(64)
      @user.password_token_timestamp = DateTime.now
      @user.save
      send_simple_message @user
      flash.now[:notice] = "An email has been sent to you providing you a link to reset your password"
      erb :"new_password/new"
    else
      flash.now[:notice] = "Your email doesn't exist in our database"
      erb :"new_password/new"
    end
  end

  get '/new_password/new' do
    flash.now[:notice] = "You have reset your password"
    erb :"new_password/new"
  end

  def send_simple_message user
    RestClient.post "https://api:key-1tzz4hywdjd7mqf2d8j1y8gq3yjqu9j4"\
    "@api.mailgun.net/v2/bookmarkmanagerulez.mailgun.org/messages",
    :from => "Excited User <osama@bookmarkmanagerulez.mailgun.org>",
    :to => "chewymeister88@googlemail.com",
    :subject => "Hello",
    :text => "Reset your password here:
    http://localhost:9393/users/reset_password/#{user.password_token}"
  end

end