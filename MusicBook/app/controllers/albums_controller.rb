class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]

  def index
    params[:action] = 'albums'
    @albums = Album.all
  end

  def show
    @songs = Song.where(:album_id => params[:id])
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

end
