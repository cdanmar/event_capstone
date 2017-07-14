Rails.application.routes.draw do
  get '/' => 'events#index'

  get '/events' => 'events#index'
  get '/events/new' => 'events#new'
  post '/events' => 'events#create'
  get '/events/:id' => 'events#show'
  get '/events/:id/edit' => 'events#edit'
  patch '/events/:id' => 'events#update'
  delete '/events/:id' => 'events#destroy'

  get '/participants/index' => 'participants#index'
  get '/participants/new' => 'participants#new'
  post '/participants' => 'participants#create'
  get '/participants/:id' => 'participants#show'
  patch '/participants/:id' => 'participants#check_in'
  delete '/participants' => 'participants#destroy'

  get '/visitors/' => 'visitors#index'
  get '/visitors/new' => 'visitors#new'
  post '/visitors' => 'visitors#create'
  get '/visitors/:id' => 'visitors#show'
  get '/visitors/:id/edit' => 'visitors#edit'
  patch 'visitors/:id' => 'visitors#update'
  delete '/visitors/:id' => 'visitors#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/signup' => 'admins#new'
  post '/admins' => 'admins#create'




end
