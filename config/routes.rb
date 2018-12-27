Rails.application.routes.draw do

  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  root 'products#index'
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  get 'payment',  to: 'static_pages#payment'
  get 'delivery', to: 'static_pages#delivery'
  get 'info',     to: 'static_pages#info'

  resources :products do
    resources :comments
  end

  resources :pages
end
