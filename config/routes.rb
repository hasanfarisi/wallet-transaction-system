Rails.application.routes.draw do
  namespace :api do
    # resources :topup_histories
    post '/login', to: 'users#login_user', as: 'login'
    post '/topup', to: 'topup_histories#topup', as: 'topup'
    post '/transfer', to: 'transfer_histories#transfer', as: 'transfer'
    resources :wallets, only: [:create]
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end
end
