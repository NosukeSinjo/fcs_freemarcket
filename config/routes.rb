Rails.application.routes.draw do


  get 'merchantlogin', to: 'merchantsessions#new'
  post 'merchantlogin', to: 'merchantsessions#create'
  delete 'logout', to: 'merchantsessions#destroy'

  get 'userlogin', to: 'usersessions#new'
  post 'userlogin', to: 'usersessions#create'
  delete 'logout', to: 'usersessions#destroy'

  resources :merchants
  resources :users
  resources :products
  
  root 'top#main'
  
  get 'get_image/:id', to: 'products#get_image'
  
  resources :orders
end
