class UsersController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        #find the user
        @user = User.find_by(email: params[:email])
        #authenticate the user
        if @user.authenticate(params[:password])
            #log in - create the user's session
            session[:user_id] = @user.id
            #redirect to the user's show page
            redirect "users/#{@user.id}"
        else 
            #notify user of invalid credentials
            #redirect to login page
        end
    end 

    get '/signup' do

    end

    get '/users/:id' do
        "Howdy"
    end

end