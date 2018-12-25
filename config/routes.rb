Rails.application.routes.draw do
  root 'products#index'

  resources :products

  get 'payment',  to: 'static_pages#payment'
  get 'delivery', to: 'static_pages#delivery'
  get 'info',     to: 'static_pages#info'

end
