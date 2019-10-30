
class TweetsController < ApplicationController

  get '/tweets' do
    if current_user
      erb :'tweets/tweets'
    else
      redirect '/login'
    end
  end

end
