Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'users#index'
    
    resources :users

    resources :auctions

    resources :items

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    get '/signup' => 'users#new'
    post '/users' => 'users#create'


  
 

  get '/auth/:provider/callback' => 'sessions#create_session'
  post '/auth/:provider/callback' => 'sessions#create_session'
  


end
