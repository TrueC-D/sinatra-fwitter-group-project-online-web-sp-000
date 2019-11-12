
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

  get '/tweets/:id'  do
    if current_user
      @tweet = Tweet.find_by_id(params[:id])
      binding.pry
      erb :'tweets/show_tweet'
    else
      redirect '/login'
    end
  end

  delete '/tweets/:id/delete' do
    @tweet = Tweet.find_by_id(params[:id])
    if current_user
      if current_user == @tweet.user
        @tweet.delete
      end
        redirect '/tweets'
    else
      redirect '/login'
    end
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find_by_id(params[:id])
    if current_user
      if current_user == @tweet.user
        erb :'tweets/edit_tweet'
      else
        redirect '/tweets'
      end
    else
      redirect '/login'
    end
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    if current_user
      if params[:content].strip.length != 0
        if @tweet && current_user == @tweet.user
          @tweet.update(content: params[:content])
          redirect "/tweets/#{@tweet.id}"
        else
          redirect '/tweets'
        end
      else
        redirect "/tweets/#{params[:id]}/edit"
      end
    else
      redirect '/login'
    end
  end

end
