Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # resources :users, only: [:create, :new, :index, :notes]
      post '/user', to: 'users#create'
      post '/login', to: 'auth#create'
      get '/articles', to: 'articles#index'
      post '/notes', to: 'notes#create'
      get '/usernotes', to: 'users#notes'
      get '/userlexicons', to: 'users#lexicons'

    end
  end
end
