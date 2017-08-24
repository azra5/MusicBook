Rails.application.routes.draw do
  namespace :admin do
    resource :dashboard, only: [:show]
    resources :artists
    resources :genres
    resources :albums
    resources :songs
    root :to => "admin#dashboard", as: :admin
  end

  resources :genres, only: [:index]

  root 'home#index'

  resources :artists, only: [:index]

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

end
