Rails.application.routes.draw do
  resources :watcheds
  resources :favorites
  resources :movies
  resources :users
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html