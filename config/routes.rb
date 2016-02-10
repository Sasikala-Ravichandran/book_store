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
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'catalogs#index'

end
