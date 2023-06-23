Rails.application.routes.draw do
  namespace :api do
    # User
    post '/login', to: 'users#login_user', as: 'login'
    get '/profile', to: 'users#show_profile'

    post '/topup', to: 'topup_histories#topup', as: 'topup'
    get '/topup/history', to: 'topup_histories#show_topup_histories', as: 'topup_histories'

    post '/transfer', to: 'transfer_histories#transfer', as: 'transfer'
    get '/transfer/history', to: 'transfer_histories#show_transfer_histories', as: 'transfer_histories'

    get '/price/:symbol', to: 'stocks#price'
    get '/prices', to: 'stocks#prices'
    get '/price_all', to: 'stocks#price_all'
    resources :wallets, only: [:create]
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end
end
