Rails.application.routes.draw do
  post 'top/login'

  get 'signup', to: 'merchants#new'
  post 'signup', to: 'merchants#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  


  resources :merchants
  resources :users
  resources :products
  
  root 'top#main'
  get 'top/main'
  
  get 'get_image/:id', to: 'products#get_image'
  
  resources :orders
end
