Rails.application.routes.draw do
    
  #namespace :api, format: 'json' do
  #  namespace :v1 do
  #    resources :user
  #  end
  #end
  get 'users/new'

  get 'users/showall'

  get 'users/update'
  
  get 'users/:user_id', to: 'users#show'
  
  delete 'users/:user_id' => 'users#deleteall'
  
  delete 'users/todo/:id' => 'users#destroy'
  
  resources :users do
    resources :todos
  end
  
  get '/api/v1/user/:user_id', to: 'todoapi#show'
  
  post '/api/v1/user', to: 'todoapi#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root  "home#index"
end

# users/1/todos         : todos by user
# users/todos          : admin todos all user
# users/1/todos/delete  : delete todos by user
# users/1/todos/2/delete
# users/todos/delete    : all delete