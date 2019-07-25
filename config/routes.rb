Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :books
  resources :products
  resources :users
end
