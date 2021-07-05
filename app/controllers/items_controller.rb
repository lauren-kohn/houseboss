class ItemsController < ApplicationController

    #get items/new (render form to create new item)
    get '/items/new' do
        erb :'/items/new'
    end

    #post item (allows form response; creates new item with params)
    post '/items' do 
    
    end

    #show route for item


    #index route for all items

end
