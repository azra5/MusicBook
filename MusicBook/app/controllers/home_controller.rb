class HomeController < ApplicationController
  def index
  	@songs = Song.order(:created_at).page params[:page]
  end

  def albums
  end
  def songs
  end
  def artists
  end
  def playlists
  end
  def favourites
  end
end
