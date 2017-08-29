class HomeController < ApplicationController

  def index
    p params[:search]
    @songs = Song.search(params[:search]).page params[:page]
    @trending = Song.trending(10)
    @albums = Album.order(:created_at).take(5)
  end

  def songs
    params[:action] = 'songs'
    @songs = Song.order(:created_at).page params[:page]
  end

  def favourites
        params[:action] = 'favourites'
        @favourites = Favourite.all
  end

  def addOrRemoveSongFromFavourites

    @favourites = Favourite.where(:user_id => cookies[:user_id], :song_id => params[:id])
    if(@favourites.count > 0 )
        @favourites.destroy_all
        msg = { :status => "ok", :message => "Success!", :action => "Add to favourites" }
        render :json => msg 
    else

    @favourite = Favourite.new
    @favourite.song_id = params[:id]
    @favourite.user_id = cookies[:user_id]

    if @favourite.save
        msg = { :status => "ok", :message => "Success!", :action => "Remove from favourites" }
        render :json => msg      
        else
        msg = { :status => "ok", :message => "Error!", :action => "" }
        render :json => msg 
      end
    end
  end

end
