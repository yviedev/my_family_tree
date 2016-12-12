Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/familymembers' => 'users#index'
  get '/familymembers/:id' =>'users#show'
end
