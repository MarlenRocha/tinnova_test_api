Rails.application.routes.draw do
  resources :favorites
  resources :beers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  post 'auth/login', to: 'authentication#login'

end


  