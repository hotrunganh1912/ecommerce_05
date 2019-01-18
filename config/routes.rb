Rails.application.routes.draw do
  root "products#index"
  get "carts/show"
  get "users/products"
  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_details, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
