Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :watcheds
      resources :favorites
      resources :movies
        get 'movies/genres/:genre', to: 'movies#genres'
      resources :users, only: [:create]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
        get 'user/:id/favorites', to: 'users#favorites'
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html