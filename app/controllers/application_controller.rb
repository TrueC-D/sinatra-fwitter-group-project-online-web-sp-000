require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
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
    if params.any? {|key, value| value.length == 0} == true
      redirect '/signup'
    else
      redirect '/tweets'
    end
  end
  
  get '/login' do
    erb :'users/login'
  end
  
  post '/login' do 
    
  end
  
  get '/tweets' do 
    erb :'tweets/tweets'
  end
  
  get '/logout' do
    ''
  end

end
