Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'products#index'

  get 'order/:id', to: 'orders#show', as: 'order'
  get 'order_details', to: 'orders#order_details'
  patch 'update_order_details', to: 'orders#update_order_details'
  get 'cart', to: 'carts#show', as: 'cart'
  resources :order_items, only: [:create, :update, :destroy]
  resources :pages

  # get 'confirm',  to: 'carts#confirm'

  resources :products do
    resources :comments
  end
end

  # get 'order_items/create'
  # get 'order_items/update'
  # get 'order_items/destroy'
  # get 'carts/show'
  # resources :products
