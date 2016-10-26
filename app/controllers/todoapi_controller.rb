class TodoapiController < ApplicationController
    protect_from_forgery :except => [:create ,:show, :create_user] # CSRFエラー防ぐためにCSRFをoff に
    def index
    end
          
    def create
        Todo.createByJson(request.body.read)
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
    
    # アプリでユーザ登録
    def create_user
        @data = JSON.parse(request.body.read)
        @user_data = {}
        @user_data[:name] = @data['name']
        @user_data[:password] = @data['password']
        @user_data[:password_confirmation] = @data['password_confirmation']
        @user = User.new(@user_data)
        @ret = {id: 0}
        if(@user.save)
            @ret[:id] = @user[:id]
        end
        render json: @ret
    end
    
    private
  
       # def user_params
    #        params.require(:user).permit(:name, :email, :password, :password_confirmation)
     #   end
    
end
