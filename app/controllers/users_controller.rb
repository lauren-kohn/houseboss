class UsersController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        #find the user
        @user = User.find_by(email: params[:email])
        #authenticate the user
        #log in
        #redirect to the user's landing page
    end 

    get '/signup' do

    end

end