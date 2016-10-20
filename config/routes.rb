#require 'api_contraints'
Rails.application.routes.draw do
  #mount API::Root => '/api'
  #mount Api::V1::UserController => '/'
  mount Root => '/'
  
  #mount Todog::API => '/'
  
  #namespace :api, defaults: {format: 'json'} do
      #  scope module: :v1, constraints: ApiConstraints.new(version: 1 , default: true) do
      #resources :user
    #end
  #end
  get 'users/new'

  get 'users/show'

  get 'users/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root  "home#index"
end
