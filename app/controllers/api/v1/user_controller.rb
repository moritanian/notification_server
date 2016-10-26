#module Api
  #  module V1
      #  class UserController < ApplicationController
    class Api::V1::UserController
            def index
            end
          
            def create
                @data = params[:data]
                p @data
                Todo.createByJson(@data)
            end
            
            def show 
                @user_id = params[:user_id]
                @todos = Todo.find(:conditions => { :category_id => @user_id })
                respond_to do |format|
                    #format.html # => 通常のURLの場合、index.html.erb が返される
                    format.json { render json: @todos } # URLが.jsonの場合、@products.to_json が返される
                end
            end
    end
 #  end
#end