
class TweetsController < ApplicationController

  get '/tweets' do
    if current_user
      erb :'tweets/tweets'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end

  get '/tweets/#{tweet.id}'  do
    erb :'tweets/show_tweet'
  end

  get '/tweets/#{tweet.id}/edit' do
    erb :'tweets/edit_tweet'
  end
end
