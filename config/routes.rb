Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :drinks do
    resources :likes
  end
  
  resources :users
  resources :products
  
  resources :user_drinks do
    resources :drinks
  end
    resources :users

  resources :product_drinks
  resources :user_products
  
  get '/login' to, to: 'sessions#new'
  post '/login' to, to: 'sessions#create'
  delete '/logout' to, to: 'sessions#destroy'

end

