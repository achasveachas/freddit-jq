Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #Omniauth routes
  get '/auth/github/callback' => 'sessions#create_oauth'
  get '/auth/failure' => 'index#home'

  patch 'user/:id/ban' => 'users#ban', as: 'user_ban'
  patch 'user/:id/admin' => 'users#admin', as: 'user_admin'

  resources :users
end
