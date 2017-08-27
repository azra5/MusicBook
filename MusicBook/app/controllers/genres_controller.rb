class GenresController < ApplicationController
  before_action :set_genre, only: [:show]

  def index
    params[:action] = 'genres'
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @songs = Song.where(:genre_id => params[:id])
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end
end
