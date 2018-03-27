Rails.application.routes.draw do
  
  resources :users do
    resources :todos
  end
  
  mount Root => '/'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root  "home#index"
end
