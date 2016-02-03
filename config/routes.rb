Rails.application.routes.draw do
   resources :authors
   resources :publishers
   root 'catalogs#index'
end
