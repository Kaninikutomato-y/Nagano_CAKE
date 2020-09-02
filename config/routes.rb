Rails.application.routes.draw do



  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items' => 'cart_items#destroy_all'
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]


  devise_for :admins, controllers: {
    sessions: 'admin/admins/sessions',
    registrations: 'admin/admins/registrations',
    passwords: 'admin/admins/passwords'
  }

  namespace :admin do
  	resources :products, only: [:new, :create, :edit, :update, :show, :index]
  	get 'home/top'
  	root 'home#top'
  	resources :orders, only: [:update, :index, :show]
  	resources :order_items, only: [:update]
  	resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :client do
    devise_for :clients, controllers: {
      sessions: 'client/clients/sessions',
      registrations: 'client/clients/registrations',
      passwords: 'client/clients/passwords'
    }
  	resources :products, only: [:index, :show]
  	get 'home/top'
  	root 'home#top'
  	get 'home/about'
  	resources :orders, only: [:new, :create]
  	post 'orders/confirm'
  	get 'orders/thanks'
  end

  resources :clients, only: [:show, :edit, :update] do
    member do
      get "unsubscribe"
      patch "unsubscribe"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
