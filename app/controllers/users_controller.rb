class UsersController < ApplicationController
  def new
  end

  def show
    @todos = Todo.all
  end

  def update
  end
end
