Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }

  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
    resources :order_detatils, only: [:update]

  end

  scope module: :public do
    root 'homes#top'
    get '/about'=>'homes#about'
    resources :items, only: [:index, :show]
    get 'customers/my_page'=>'customers#show'
    get 'customers/unsubscribe'=>'customers#unsubscribe'
    get 'customers/withdraw'=>'customers#withdraw'
    resources :customers, only: [:edit, :update]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

