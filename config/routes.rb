Rails.application.routes.draw do
  root 'products#index'

  get 'payment',  to: 'static_pages#payment'
  get 'delivery', to: 'static_pages#delivery'
  get 'info',     to: 'static_pages#info'

  resources :products do
    resources :comments
  end

  resources :pages
end
