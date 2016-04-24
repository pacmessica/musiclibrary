Rails.application.routes.draw do
  devise_for :users
  root "artists#index"
  resources :artists
  resources :albums
  resources :songs do
    resources :hearts
  end

  get '/search' => 'search#index', :as => 'search'
end
