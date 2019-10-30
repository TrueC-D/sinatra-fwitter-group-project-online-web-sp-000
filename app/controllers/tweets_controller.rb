
class TweetsController < ApplicationController

  get '/tweets' do
    @current_user = User.find_by_id(session[:user_id])
    erb :'tweets/tweets'
  end

end
