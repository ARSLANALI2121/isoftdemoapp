Rails.application.routes.draw do
  root 'blogs#index'
  devise_for :users
  
resources :blogs do
  resources :comments 
  resources :likes
end
resources :comments do 
  resources :likes
end
end
