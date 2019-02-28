Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {sessions: "users/sessions"}
  root "products#index"

  get "/history", to: "orders#index"
  get "/cart", to: "carts#show"
  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  resources :products, only: [:index, :show]
  resources :cart, only: :show
  resources :order_details, only: [:create, :update, :destroy]
  resources :orders, only: [:update, :index, :show]
  resources :users, only: [:index, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
