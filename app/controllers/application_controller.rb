require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "pickles_and_milo"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do 

    def logged_in?
      #current_user returns user info or nil; adding double bang changes return to T/F
      !!current_user
    end 

    def current_user 
      #returns a user (if there is one) and nil if there isn't
      #saves the current user as a variable to prevent unnecessary db calls (after the first one)
      @current_user ||= User.find_by(id: session[:user_id])
    end 

  end

end
