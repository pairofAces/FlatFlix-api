Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :watcheds
      resources :favorites
      resources :movies
      resources :users
      get 'movies/genre/action', to: 'movies#action'
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html