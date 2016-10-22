class UsersController < ApplicationController
  def new
  end

  def show 
    @user_id = params[:user_id]
    @todos = Todo.where(user_id: @user_id)
  end
  
  def showall
    @todos = Todo.all
  end

  def update
  end
  
  def deleteall 
    @user_id = params[:user_id]
    Todo.where(user_id: @user_id).each do |todo|
      todo.destroy      
    end 
    
    #redirect_to users_path
    redirect_to(:back)
  end
  
  def destroy
    @id = params[:id]
    Todo.find(@id).destroy
    redirect_to(:back)
    #redirect_to users_showall_path
  end

end
