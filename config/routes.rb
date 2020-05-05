Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :drinks
  resources :users
  resources :products
  resources :user_drinks do
    resources :drinks
  end
    resources :users

  resources :product_drinks
  resources :user_products


end

