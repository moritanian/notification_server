#module API::V1
    class Todog < Grape::API
      format 'json'
    
      resource :todos do
        desc "Return list of users"
        get '/' do
          Todo.all
        end
      end
    end
#end