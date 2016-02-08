Rails.application.routes.draw do
   resources :authors
   resources :publishers
   resources :books
   resources :users
   get 'login' => 'sessions#new'
   post 'login' => 'sessions#create'
   delete 'logout' => 'sessions#destroy'
   root 'catalogs#index'
end
