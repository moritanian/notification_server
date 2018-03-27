class UsersController < ApplicationController
  def new
  end
  
  def index 
    @todos = Todo.all
  end

  def show 
    @user_id = params[:id]
    @todos = Todo.where(user_id: @user_id)
    @users = [User.find(@user_id)]
  end

  def update
  end
  
  def destroy
    @user_id = params[:id]
    User.find(@user_id).destroy
    redirect_to(:back)
    #redirect_to users_showall_path
  end

end
