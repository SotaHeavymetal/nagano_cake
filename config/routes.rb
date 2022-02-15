Rails.application.routes.draw do
  devise_for :customers

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :sessions, only: [:new, :create, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
    resources :order_detatils, only: [:update]

  namespace :public do
    root to: 'homes#top'
    get 'home/about'=>'homes#about'
    resources :items, only: [:index, :show]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :customers, only: [:edit, :update, :unsubscribe, :withdraw]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end
  end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

