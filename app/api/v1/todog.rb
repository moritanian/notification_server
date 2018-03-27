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
          @user = User.new(@user_data, params[:user_id])
          @ret = {id: 0}
          if(@user.save)
              @ret[:id] = @user[:id]
          end
          @ret
        end
        
        post '/:user_id/todos' do
          @data = JSON.parse(request.body.read)
          Todog.before_request(@data, params[:user_id])
          
          @user_data = @data["user"]
          @todos = Todo.where(user_id: params[:user_id])
          Todo.serialize(@todos)
        end
        
        post '/:user_id/todos/create' do
          @data = JSON.parse(request.body.read)
          @user = Todog.before_request(@data, params[:user_id])
        
          @todo_list = @data['target']
          Todo.create(@user, @todo_list)
        end
        
        def self.before_request(data, user_id)
          @user_data = data["user"]
          if @user_data["id"].nil? or @user_data["password"].nil? or @user_data["id"] !=  user_id
              bad_request
          end
          @user_id = @user_data["id"]
          @password = @user_data["password"]
          @name = @user_data['name']
          @user = User.where(name: @name).first
          if (@user.nil? or !@user.authenticated?(@password))
            bad_request
          end
          return @user
        end
        
        def self.bad_request 
            error!("Unauthorized! Invalid token.", 401)
            exit
        end
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      end
    end
end