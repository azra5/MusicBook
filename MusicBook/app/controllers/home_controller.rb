class HomeController < ApplicationController

  def index
  	@songs = Song.order(:created_at).page params[:page]
    query = "select favourites.*, count(song_id) num from favourites group by song_id order by num limit 5"
    @trending = ActiveRecord::Base.connection.execute(query)
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
