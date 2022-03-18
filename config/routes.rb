Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers,skip: [:passwords], controllers: {
   sessions:      'public/sessions',
   registrations: 'public/registrations'
  }

  namespace :admin do
    root 'homes#top'
    get '/orders/:id' => 'orders#show'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    patch 'orders/order_id/order_detatils/:id' => 'orders#update'
  end

  scope module: :public do
    get 'search' => 'items#search'
    root 'homes#top'
    get '/about'=>'homes#about'
    get '/thanks'=>'homes#thanks'
    resources :genres, only: [:show]
    resources :items, only: [:index, :show]
    get 'customers/my_page' => 'customers#show', as: :mypage
    get 'customers/unsubscribe'=>'customers#unsubscribe'
    patch 'customers/withdraw'=>'customers#withdraw'
    get 'publics/edit'=>'customers#edit'
    patch 'customers/update'=>'customers#update'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post 'orders/confirm' => 'orders/confirm'
    get 'orders/complete' => 'orders/complete'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

