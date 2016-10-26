class TodosController < ApplicationController
    def index
    end
    
    def destroy
        @id = params[:id]
        Todo.find(@id).destroy
        redirect_to(:back)
        #redirect_to users_showall_path
    end  
    
    def delete_all 
        @user_id = params[:user_id]
        Todo.where(user_id: @user_id).each do |todo|
            todo.destroy      
        end 
    
        #redirect_to users_path
        redirect_to(:back)
    end
end
