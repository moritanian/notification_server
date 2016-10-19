Rails.application.routes.draw do
    
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :user
    end
  end
  get 'users/new'

  get 'users/show'

  get 'users/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root  "home#index"
end
