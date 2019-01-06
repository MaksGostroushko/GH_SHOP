Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'products#index'

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :pages
  resources :orders

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
