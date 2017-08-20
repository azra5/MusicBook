Rails.application.routes.draw do
  resources :genres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :artists

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resource :dashboard, only: [:show]
    #resource :artists
    get 'artists' => 'artists#index'
    get 'artists/new' => 'artists#new'
    get 'artists/show/:id' => 'artists#show'

  end


end
