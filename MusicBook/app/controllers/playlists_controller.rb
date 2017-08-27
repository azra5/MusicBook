class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def numberOfSongs(id)
    return PlaylistSong.where(:playlist_id => id).count
  end

  helper_method :numberOfSongs
  
  def index
    params[:action] = 'playlists'
    @playlists = Playlist.where(:user_id => cookies[:user_id])
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def edit
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = cookies[:user_id]
    @playlist.numOfSongs = 0
    
      if @playlist.save
        redirect_to @playlist, notice: 'Playlist was successfully created.' 
      else
        render :new 
      end
  end

  def update
      if @playlist.update(playlist_params)
        redirect_to @playlist, notice: 'Playlist was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @playlist.destroy
      redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' 
  end

  def playlist_songs
    @songs = PlaylistSong.where("playlist_songs.playlist_id" => params[:id])
  end

  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:name, :numOfSongs, :user_id)
    end
end
