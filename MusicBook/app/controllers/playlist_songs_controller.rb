class PlaylistSongsController < ApplicationController
  before_action :set_playlist_song, only: [:show, :edit, :update, :destroy]

  def index
    @playlist_songs = PlaylistSong.all
  end

  def show
  end

  def new
    @playlist_song = PlaylistSong.new
  end

  def edit
  end

  def create
    @playlist_song = PlaylistSong.new(playlist_song_params)

      if @playlist_song.save
        redirect_to @playlist_song, notice: 'Playlist song was successfully created.' 
      else
        render :new 
      end
  end

  def update
      if @playlist_song.update(playlist_song_params)
        redirect_to @playlist_song, notice: 'Playlist song was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @playlist = Playlist.find(@playlist_song.playlist_id)
    @playlist_song.destroy
      redirect_to playlist_songs_list_path(@playlist), notice: 'Song was successfully removed.' 
  end

  private
    def set_playlist_song
      @playlist_song = PlaylistSong.find(params[:id])
    end

    def playlist_song_params
      params.require(:playlist_song).permit(:song_id, :playlist_id)
    end
end
