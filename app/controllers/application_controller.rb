require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "S3C43T"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :'index'
  end

  get '/signup' do
    if session[:user_id] != nil
      redirect '/tweets'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    if params.any? {|key, value| value.strip.length == 0} == true
      redirect '/signup'
    else
      user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      user.save
      redirect '/tweets'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] == @user.id
      redirect :'/tweets'
    else
      redirect :'/login'
    end
  end

  get '/tweets' do
    erb :'tweets/tweets'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
