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
  
 # resources :users
  
  get '/api/v1/user/:user_id', to: 'todoapi#show'
  
  post '/api/v1/user', to: 'todoapi#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root  "home#index"
end
