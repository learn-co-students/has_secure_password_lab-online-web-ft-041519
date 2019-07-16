Rails.application.routes.draw do

  get 'welcome/index'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'

  resources :sessions, only: [:create]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
