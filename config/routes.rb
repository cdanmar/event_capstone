Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/signup' => 'admins#new'
  post '/admins' => 'admins#create'
end
