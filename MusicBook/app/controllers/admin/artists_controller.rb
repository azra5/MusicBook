class Admin::ArtistsController < Admin::BaseController
  before_action :set_artist, {only: [ :edit, :update, :show, :destroy]}

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

      if @artist.save
        redirect_to admin_artist_path(@artist), notice: 'Artist was successfully created.'
      else
        render :new
      end
  end

  def edit
  end

  def update
      if @artist.update(artist_params)
        redirect_to admin_artist_path(@artist), notice: 'Artist was successfully updated.'
      else
        render :edit
      end
  end

  def show
  end

  def destroy
    @artist.destroy
      redirect_to admin_artists_path, notice: 'Artist was successfully destroyed.'
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :dob, :placeOfBirth, :state, :address)
    end
end
