class UsersController < ApplicationController
  get '/signup' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
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
      session[:user_id] = user.id
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

  get '/logout' do
    session.clear
    redirect '/'
  end
end
