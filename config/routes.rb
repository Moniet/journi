Rails.application.routes.draw do
  resources :posts, only: [:create, :update, :destroy]
  resources :users, only: [:create, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
