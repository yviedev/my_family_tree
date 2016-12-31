Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'users#home'
  get '/newsfeed' => 'users#newsfeed'
  get '/signup' => 'users#new'

  get '/familymembers'=> 'users#index'
  post '/familymembers' =>'users#create'
  get '/familymembers/new' => 'users#new_family_member'
  post '/addfamilymember' => 'users#create_family_member'
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

  get '/statusupdates' => 'user#statusupdates'

  get '/myfamily' => 'groups#index'
  get '/myfamily/new' => 'groups#new'
  post '/myfamily' => 'groups#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
