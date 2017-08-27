class PlaylistSongsController < ApplicationController
  before_action :set_playlist_song, only: [:show, :edit, :update, :destroy]

  def index
    @playlist_songs = PlaylistSong.all
  end

  def show
  end

  def new
    @playlist_song = PlaylistSong.new
    respond_to do |format|
    format.html
    format.js
  end
  end

  def edit
  end

  def create

    @playlist_songs = PlaylistSong.where(:playlist_id => playlist_song_params[:playlist_id], :song_id => playlist_song_params[:song_id])

    if(@playlist_songs.count > 0)
      render :json => 'You already added this song to this playlist.'
    else
       @playlist_song = PlaylistSong.new(playlist_song_params)

      if @playlist_song.save
        render :json => 'Song successfully added to the playlist.' 
      else
        render :json => 'Error adding song to the playlist.' 
      end
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
