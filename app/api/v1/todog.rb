module V1
    class Todog < Grape::API
      format 'json'
    
      resources :users do 
        get '/' do
          User.all
        end
        
        get '/:user_id' do
          User.find(params[:user_id])
        end
        
        post '/create' do
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
        
        get '/:user_id/todos' do 
          @user_id = params[:user_id]
          @todos = Todo.where(user_id: @user_id)
          Todo.serialize(@todos)
        end
        
        post '/:user_id/todos/create' do
          Todo.createByJson(request.body.read)
        end
      end
    end
end