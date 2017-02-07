Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  patch 'user/:id/ban' => 'users#ban', as: 'user_ban'
  patch 'user/:id/admin' => 'users#admin', as: 'user_admin'

  resources :users
end
