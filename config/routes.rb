Rails.application.routes.draw do
  resource  :session
  resources :passwords, param: :token

  resources :products do
    resources :subscribers, only: [ :create ]
  end

  resources :reviews

  resource :unsubscribe, only: [ :show ]

  root "products#index"
end
