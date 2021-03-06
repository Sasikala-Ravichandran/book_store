Rails.application.routes.draw do

  namespace :admin do
    get 'base/index'
    resources :authors
    resources :books
    resources :publishers
  end

  resources :books, only: [:show]
  resources :users, only: [:index, :show, :new, :create]
  resources :catalogs, only: [:index, :show ] do
    collection do
      post :search, to: 'catalogs#search'
    end
  end
  resources :carts, only: [:show, :destroy]
  resources :cart_items, only: [:create]
  resources :orders, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'expired_token' => 'password_resets#expired_token'
  root 'catalogs#index'

end
