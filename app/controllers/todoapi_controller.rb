class TodoapiController < ApplicationController
    protect_from_forgery :except => [:create ,:show] # CSRFエラー防ぐためにCSRFをoff に
    def index
    end
          
    def create
        @data = params[:data]
        #p @data
        Todo.createByJson(@data)
    end
            
    def show 
        @user_id = params[:user_id]
        @todos = Todo.where(user_id: @user_id)
       # respond_to do |format|
            #format.html # => 通常のURLの場合、index.html.erb が返される
     #       format.json { render json: @todos } # URLが.jsonの場合、@products.to_json が返される
    #    end
        render json: Todo.serialize(@todos) 
    end
    
end
