Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users/find', to: 'users#find'
  resources :users, :items, :categories, only: [:index, :create, :update, :show, :destroy]

end
