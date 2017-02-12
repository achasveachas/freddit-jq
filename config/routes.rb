Rails.application.routes.draw do

  get 'conversations/index'

  get 'conversations/show'

  get 'conversations/new'

  get 'conversations/create'

  get 'conversations/edit'

  get 'conversations/update'

  get 'conversations/destroy'

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

  resources :conversations do
    resources :comments
  end
end
