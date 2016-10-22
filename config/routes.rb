#require 'api_contraints'
Rails.application.routes.draw do
  mount Root => '/'
  
  get 'users/new'

  get 'users/show'

  get 'users/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root  "home#index"
end
