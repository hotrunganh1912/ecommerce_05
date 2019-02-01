Rails.application.routes.draw do
  root "products#index"

  post "/signup", to: "users#create"
  get "/signup", to: "users#new"
  get "/carts", to: "carts#show"
  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  resources :users
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_details, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
