module API
  module V1
    class Todo < Grape::API
      resource :todos do

        # GET /api/v1/todo
        get do
          Todo.all
        end

        # GET /api/v1/todo/{:id}
        desc 'Return a person.'
        params do
          requires :id, type: Integer, desc: 'Todo id.'
        end
        get ':id' do
          Todo.find(params[:id])
        end
      end
    end
  end
end