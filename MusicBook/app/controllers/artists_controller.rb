class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show]

  def index
        params[:action] = 'artists'
    @artists = Artist.all
  end

  def show
    @albums = Album.where(:artist_id => params[:id])
    @songs = Song.where(:artist_id => params[:id])
  end

    private
    def set_artist
      @artist = Artist.find(params[:id])
    end

end
