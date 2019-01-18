Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  get "carts/show"
  get "users/products"
  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  resources :products
  resource :cart, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
