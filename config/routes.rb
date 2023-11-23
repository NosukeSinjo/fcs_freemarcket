Rails.application.routes.draw do
  post 'top/login'

  get 'top/logout'
  get 'top/login'

  resources :users

  root 'top#main'
  get 'top/main'
  post 'products/index'
  get 'get_image/:id', to: 'products#get_image'
  resources :products
  resources :orders
end
