Rails.application.routes.draw do
  resources :favourites
  resources :playlist_songs
  resources :playlists
  namespace :admin do
    resource :dashboard, only: [:show]
    resources :artists
    resources :genres
    resources :albums
    resources :songs
    root :to => "dashboards#index", as: :root
  end

  resources :genres, only: [:index]

  root 'home#index'


  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  get '/artists' => 'home#artists', as: :artists_home
  get '/songs' => 'home#songs', as: :songs_home
  get '/playlists' => 'home#playlists', as: :playlists_home
  get '/albums' => 'home#albums', as: :albums_home
  get '/favourites' => 'home#favourites', as: :favourites_home

  get '/playlists/:id/songs' => 'playlists#playlist_songs', as: :playlist_songs_list

  
end
