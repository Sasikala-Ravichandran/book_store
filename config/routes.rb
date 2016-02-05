Rails.application.routes.draw do
   resources :authors
   resources :publishers
   resources :books
   resources :users
   root 'catalogs#index'
end
