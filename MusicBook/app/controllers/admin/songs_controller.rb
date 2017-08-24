class Admin::SongsController < Admin::BaseController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit
  end

  
  def create
    @song = Song.new(song_params)

      if @song.save
        redirect_to admin_song_path(@song), notice: 'Song was successfully created.' 
      else
        render :new 
      end
  end

  def update
      if @song.update(song_params)
        redirect_to admin_song_path(@song), notice: 'Song was successfully updated.' 
      else
        render :edit 
      end
  end


  def destroy
    @song.destroy
      redirect_to admin_songs_path, notice: 'Song was successfully destroyed.' 
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:name, :artist_id, :album_id, :genre_id, :duration)
    end
end
