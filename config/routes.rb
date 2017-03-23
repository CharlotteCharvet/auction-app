Rails.application.routes.draw do
  get 'braintree/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  post 'braintree/checkout'
  resources :users do
    resources :auctions
  end

  resources :auctions do
    resources :items
  end

  resources :items do 
    resources :bids, only: [:new, :create, :index]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  get '/auth/:provider/callback' => 'sessions#create_session'
  post '/auth/:provider/callback' => 'sessions#create_session'
  
end
