#require 'api_contraints'
Rails.application.routes.draw do
    
  #namespace :api, format: 'json' do
  #  namespace :v1 do
  #    resources :user
  #  end
  #end
  
  resources :users do
    resources :todos
  end
  
  # delete '/users/:user_id/todos/', to: 'todos#delete_all'
  
  # get '/api/v1/user/:user_id', to: 'todoapi#show'
  
  # post '/api/v1/user/:user_id/todo/create', to: 'todoapi#create'
  
  # post '/api/v1/user/create', to: 'todoapi#create_user'
  
  mount Root => '/'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root  "home#index"
end

# users/1/todos         : todos by user
# users/todos          : admin todos all user
# users/1/todos/delete  : delete todos by user
# users/1/todos/2/delete
# users/todos/delete    : all delete