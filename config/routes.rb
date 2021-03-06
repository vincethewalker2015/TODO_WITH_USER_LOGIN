Rails.application.routes.draw do
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/help', to: 'pages#help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  resources :users
  resources :todos
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
