Rails.application.routes.draw do
  devise_for :customers
  root to: 'homes#top'
  get 'home/about'=>'homes#about'
  resources :items, only: [:index, :show]
  resources :cart_items
  resources :orders
  namespace :admin do
    resources :genres
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
