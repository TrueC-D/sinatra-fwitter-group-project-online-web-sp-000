require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do 
    "Welcome to Fwitter"
  end
  
  get '/signup' do
  end
  
  get '/login' do
  end
  
  post '/login' do 
  end
  
  get '/tweets' do 
  end
  
  get '/logout' do
  end

end
