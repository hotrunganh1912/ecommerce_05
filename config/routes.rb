Rails.application.routes.draw do

  get 'orders/show'
  root "products#index"

  get "/history", to: 'orders#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get "/carts", to: "carts#show"
  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/products.:id", to:"products#show"
  resources :users
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resources :order_details, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
