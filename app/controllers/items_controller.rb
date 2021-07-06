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
        @items = current_user.items
        #@items = Item.all - only suitable for if a user needs to see other users' items; not desireable at this time
        erb :'/items/index'
    end

    #show route for item
    get '/items/:id' do 
        set_item
        if @item.user_id == current_user.id
            erb :'/items/show'
        else
            redirect '/items'
        end
    end

    #this route renders the form to edit an item
    get '/items/:id/edit' do 
        set_item
        if logged_in?
            if @item.user == current_user
                erb :'/items/edit'
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/' 
        end
    end

    #this route will edit a particular item
    patch '/items/:id' do 
        set_item
        if logged_in?
            if @item.user == current_user && params[:name] != "" && params[:description] != ""
                @item.update(name: params[:name], description: params[:description]) 
                redirect "/items/#{@item.id}"
            else
                redirect "/users/#{current_user.id}"
            end 
        else
            redirect '/'
        end
    end

    delete '/item/:id' do 
        set_item
        if @item.user == current_user
            @item.destroy
            redirect '/items'
        else
            redirect '/'
        end
    end

    private

    def set_item
        @item = Item.find(params[:id])
    end 
end
