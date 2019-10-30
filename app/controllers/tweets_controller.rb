
class TweetsController < ApplicationController

  get '/tweets' do
    if current_user
      erb :'tweets/tweets'
    else
      redirect '/login'
    end
  end

  get '/users/#{user.slug}' do
    if current_user
      erb :'users/show'
    else
    end
  end

end
