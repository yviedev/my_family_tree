Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'users#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/familymembers'=> 'users#index'
  get '/familymembers/new' => 'users#new_family_member'
  post '/familymembers' => 'users#create_family_member'
  
  get '/familymembers/:id' =>'users#show'
  get '/familymembers/:id/edit' =>'users#edit'
  patch '/familymembers/:id' =>'users#update'
  delete '/familymembers/:id' =>'users#destroy'

  get '/relationships/new'=> 'relationships#new'
  post '/relationships'=> 'relationships#create'
  get '/relationships/:id'=> 'relationships#show'
  get '/relationships/:id/edit' => 'relationships#edit'
  patch '/relationships/:id' =>'relationships#update'
  delete '/relationships/:id' =>'relationships#destroy'

  get '/newsfeed' => 'status_updates#index'
  get '/newsfeed/new' => 'status_updates#new'
  post '/newsfeed' => 'status_updates#create'
  delete '/newsfeed/:id' =>'status_updates#destroy'

  post '/comments' => 'comments#create'
  delete '/comments/:id' =>'comments#destroy'

  post '/likes' => 'likes#create'
  patch '/likes/:id' => 'likes#update'

  get '/myfamily' => 'groups#index'
  get '/myfamily/new' => 'groups#new'
  post '/myfamily' => 'groups#create'

  get '/images/new' => 'images#new'
  post '/images/' => 'images#create'
  delete '/images/:id' =>'images#destroy'

  get '/maps' => 'maps#index'
  get '/maps/new' => 'maps#new'
  post '/maps' => 'maps#create'
  get '/maps/:id' => 'maps#show'
  get '/maps/:id/edit' => 'maps#edit'
  patch '/maps/:id' => 'maps#update'

  get '/tree' => 'trees#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
