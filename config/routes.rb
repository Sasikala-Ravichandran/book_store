Rails.application.routes.draw do
   resources :authors
   resources :publishers
   resources :books
   root 'catalogs#index'
end
