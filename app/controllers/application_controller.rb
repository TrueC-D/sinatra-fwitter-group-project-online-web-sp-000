require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "S3C43T"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :'index'
  end

  helpers do
    def current_user
      User.find_by_id(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end
    #
    # def self.find_by_slug(slug)
    #   self.all.find{ |instance| instance.slug == slug}
    # end

  end

end
