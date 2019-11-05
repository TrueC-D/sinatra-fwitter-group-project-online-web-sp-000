class UsersController < ApplicationController
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if current_user
      redirect '/tweets'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    if params.any? {|key, value| value.strip.length == 0}
      redirect '/signup'
    else
      user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      user.save
      session[:user_id] = user.id
      redirect '/tweets'
    end
  end

  get '/login' do
    if current_user
      redirect '/tweets'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      @username = @user.username
      redirect :'/tweets'
    else
      redirect :'/login'
    end
  end

  get '/logout' do
    if current_user
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  def slug
    self.username.gsub(' ', '-').downcase
  end

  get '/users/#{user.slug}' do
    user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
end
