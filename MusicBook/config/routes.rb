Rails.application.routes.draw do
  resources :favourites, only: [:destroy]
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

  get '/artists' => 'artists#index', as: :artists_home
  get '/artist/:id' => 'artists#show', as: :artist_show

  get '/albums' => 'albums#index', as: :albums_home
  get '/album/:id' => 'albums#show', as: :album_show


  get '/songs' => 'home#songs', as: :songs_home
  get '/playlists' => 'home#playlists', as: :playlists_home
  get '/favourites' => 'home#favourites', as: :favourites_home

  get '/playlists/:id/songs' => 'playlists#playlist_songs', as: :playlist_songs_list

  get 'home/addOrRemoveSongFromFavourites/:id' => 'home#addOrRemoveSongFromFavourites', as: :addOrRemoveSongFromFavourites
  
end
