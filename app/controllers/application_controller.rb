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
      erb :'users/create_user'
  end

  post '/signup' do
    if params.any? {|key, value| value.strip.length == 0} == true
      redirect '/signup'
    else
      user = User.new(:username => params[:username], :email => params[:email], :pawword => params[:password])
      user.save
      redirect '/tweets'
    end
  end

  get '/login' do

    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    redirect :'/tweets'
  end

  get '/tweets' do
    erb :'tweets/tweets'
  end

  get '/logout' do
  end

end
