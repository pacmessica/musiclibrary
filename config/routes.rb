Rails.application.routes.draw do
  devise_for :users
  root "artists#index"
  resources :artists
  resources :albums
  resources :songs

  get '/search' => 'search#index', :as => 'search'
end
