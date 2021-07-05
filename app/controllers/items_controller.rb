class ItemsController < ApplicationController

    #get items/new (render form to create new item)
    get '/items/new' do
        erb :'/items/new'
    end

    #post item (allows form response; creates new item with params)
    post '/items' do 
        if !logged_in?
            redirect '/'
        end
        if params[:name] != "" && params[:description] != ""
            @item = Item.create(name: params[:name], description: params[:description], user_id: current_user.id)
            redirect "/items/#{@item.id}"
        else
            redirect "/items/new"
        end
    end

    #index route for all items
    get '/items' do 
        @items = Item.all
        erb :'/items/index'
    end

    #show route for item
    get '/items/:id' do 
        set_item
        erb :'/items/show'
    end

    #this route renders the form to edit an item
    get '/items/:id/edit' do 
        set_item
        erb :'/items/edit'
    end

    #this route will edit a particular item
    patch '/items/:id' do 
        set_item
        @item.update(name: params[:name], description: params[:description])
        redirect "/items/#{@item.id}"
    end

    private

    def set_item
        @item = Item.find(params[:id])
    end 
end
