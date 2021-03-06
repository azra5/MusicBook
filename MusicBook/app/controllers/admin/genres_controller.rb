class Admin::GenresController < Admin::BaseController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = cookies[:user_id]

      if @genre.save
        redirect_to admin_genre_path(@genre), notice: 'Genre was successfully created.'
      else
       render :new
      end
  end

  def update
      if @genre.update(genre_params)
        redirect_to admin_genre_path(@genre), notice: 'Genre was successfully updated.'
      else
        render :edit
      end

  end

  def destroy
    @genre.destroy
      redirect_to admin_genres_path, notice: 'Genre was successfully destroyed.'
    end


  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name, :description)
    end
end
