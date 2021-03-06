Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]

  get '/users/find', to: 'users#find'
  post '/users/:id/favourites', to: 'users#add_favourite'
  delete '/users/:id/favourites', to: 'users#remove_favourite'
  
  resources :users, :items, :categories, only: [:index, :create, :update, :show, :destroy]

end
