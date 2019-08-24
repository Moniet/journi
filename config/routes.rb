Rails.application.routes.draw do
  post '/register', to: 'users#create'
  post '/login', to: 'auth#create'

  resources :posts, only: [:create, :update, :destroy]
  resources :users, only: [:destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
