Rails.application.routes.draw do
  get 'user/user_description'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:first_name', to: 'welcome#user'
  get '/', to: 'home#index'
  get '/gossip/:id', to: 'gossip#index', as: 'gossip_id'
  get '/user/:user_id', to: 'user#user_description', as: 'user_description'
  get '/gossips/new', to: 'new#index'
  post '/gossips/create', to: 'new#create'
  resources :gossip
  #delete '/sessions/logout', to: 'sessions#destroy'
  get '/sessions/login', to: 'sessions#login'
  get '/sessions/signin', to: 'sessions#signin'
  post '/sessions/new', to: 'sessions#new'
  delete '/sessions/logout', to: 'sessions#destroy'
  post '/sessions/create', to: 'sessions#create'
end
