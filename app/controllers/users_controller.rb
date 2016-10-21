class UsersController < ApplicationController
  def new
  end

  def show
    @todos = Todo.all
  end

  def update
  end
  
  def destroy
    @id = params[:id]
    Todo.find(@id).destroy
    redirect_to users_show_url
  end
end
