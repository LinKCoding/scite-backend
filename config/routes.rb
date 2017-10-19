Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # resources :users, only: [:create, :new, :index, :notes]
      post '/users', to: 'users#create'
      post '/login', to: 'auth#create'
      post '/dictionary', to: 'dictionary#define'
      get '/notes/:id', to: 'notes#article'
      get '/articles', to: 'articles#index'
      post '/notes/:id', to: 'notes#update'
      post '/notes', to: 'notes#create'
      delete '/lexicon/:id', to: 'lexicons#delete'
      post '/lexicon/:id', to: 'lexicons#update'
      post '/lexicon', to: 'lexicons#create'
      get '/lexicon', to: 'lexicons#index'
      get '/usernotes', to: 'users#notes'
      get '/userlexicons', to: 'users#lexicons'

    end
  end
end
