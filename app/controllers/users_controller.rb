class UsersController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        #find the user
        @user = User.find_by(email: params[:email])
        #authenticate the user
        if @user && @user.authenticate(params[:password])
            #log in - create the user's session
            session[:user_id] = @user.id
            #redirect to the user's show page
            redirect "users/#{@user.id}"
        else 
            #notify user of invalid credentials
            flash[:message] = "Your email and/or password was incorrect. Please sign up or try again."
            #redirect to login page
            redirect '/login'
        end
    end 

    get '/signup' do
        erb :signup
    end

    post '/users' do
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id #log in the new user
            redirect "/users/#{@user.id}"
        else
            flash[:message] = "Please complete all fields and try again."
            redirect '/signup'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/logout' do
        session.clear
        flash[:message] = "Thanks for using HouseBoss!"
        redirect '/'
    end

end