class Admin::AlbumsController < Admin::BaseController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end


  def create
    @album = Album.new(album_params)

      if @album.save
        redirect_to admin_album_path(@album), notice: 'Album was successfully created.' 
      else
        render :new 
      end
  end

  def update
      if @album.update(album_params)
        redirect_to admin_album(@album), notice: 'Album was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @album.destroy
      redirect_to admin_albums_url, notice: 'Album was successfully destroyed.' 
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:name, :year, :artist_id)
    end
end
