Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :profiles
  resources :products
  get 'searchs/create'
  resources :store
  resources :products do
    member do
        patch :add_to_cart
        put :add_to_cart
      end
  end
resources :cart
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
