Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :books do
    resources :reviews
  end
  resources :products do
    resources :reviews
  end
  resources :users
  resources :reviews
end
