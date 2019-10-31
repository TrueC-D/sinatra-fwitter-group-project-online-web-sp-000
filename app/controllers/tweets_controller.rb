
class TweetsController < ApplicationController

  get '/tweets' do
    if current_user
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if current_user
      erb :'tweets/new'
    else
      redirect '/login'
    end

  end

  post '/tweets' do
    if current_user && params[:content].strip.length != 0
      tweet = Tweet.new(:content => params[:content], :user_id => current_user.id)
      tweet.save
      redirect '/tweets'
    else
      redirect '/tweets/new'
    end
  end

  get '/tweets/#{tweet.id}'  do
    erb :'tweets/show_tweet'
  end

  get '/tweets/#{tweet.id}/edit' do
    erb :'tweets/edit_tweet'
  end
end
