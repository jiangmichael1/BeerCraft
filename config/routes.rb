Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :drinks 
  
  resources :drinks do
      member do
        put 'like', to: 'drinks#upvote'
        put 'unlike', to: 'drinks#downvote'
  end
end
  resources :users
  resources :products
  
  resources :user_drinks do
    resources :drinks
  end
    resources :users

  resources :product_drinks
  resources :user_products
  
  get '/sessions/login', to: 'sessions#new', as: "new_login"
  post '/sessions/login', to: 'sessions#create'
  delete '/sessions/logout', to: 'sessions#destroy', as: "log_out_session"
  get '/products/:id/add', to: 'products#add_to_cart', as: "add"
  


end

