Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'

  get '/login' => 'sessions#new' #shows you the form to login
  post '/login' => 'sessions#create' #signs you in with your name
  post '/logout' => 'sessions#destroy' #ends the session
  post '/users' => 'users#create'  #creates a new user
  post '/signup' => 'users#new'
end
