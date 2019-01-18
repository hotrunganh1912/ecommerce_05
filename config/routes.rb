Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  get "/cart", to: "carts#show"
  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  resources :products
  resources :cart, only: :show
  resources :order_details, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
